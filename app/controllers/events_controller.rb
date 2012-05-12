# coding: UTF-8
class EventsController < ApplicationController

  #garbage
  def comments
    render :file => "/events/commentsexample.html.erb"
  end

  def rio_event_show
    #should probably be extracted to own controller later
    raise ActionController::RoutingError.new('Not found') if params[:slug].blank?
    @event_name = URI.decode(params[:slug].gsub('-', ' ').strip)

    @rio_events = Rails.cache.fetch("rio-events-#{Date.today.to_s}") do
      @rioapi = RioApi.new
      @rioapi.retrieve_token!
      @rio_events_from_api = @rioapi.get_eventos('start-date'=>Date.today.to_s,'end-date'=>Date.today.advance(:weeks => 2).to_s)
      @rio_events = @rio_events_from_api['results'].map {|re| RioEvent.new(re)} if @rio_events_from_api['results']
    end

    @event = @rio_events.select { |e| e.name.include?(@event_name) }.try(:first)
    raise ActionController::RoutingError.new('Not found') if @event.nil?
  end

  def show
    @event_db = Event.find(params[:id])
    @graph = Koala::Facebook::API.new(app_access_token)
    @multiquery = @graph.fql_multiquery({"event"=>"select eid, name, creator, privacy, pic_small, pic_big, location, description, venue, start_time, end_time from event where eid = #{@event_db.fid}","creator"=>"select name, pic_small, profile_url from user where uid in (select creator from #event)"})
    @event = FacebookEvent.new(@multiquery['event'][0])
    @creator = TransientUser.new(@multiquery["creator"][0]) if @multiquery["creator"][0]

    if request.xhr?
      render :action => "show", :layout => false
    end
  end

  def new
    #Explanation about the process
    render :file => "/events/new"
  end

  def start_import
    require_login!
    @graph = Koala::Facebook::API.new(current_user.access_token)
    user_events_from_api = @graph.get_connections('me', 'events')
    eids_from_api = user_events_from_api.map {|e| e["id"]}
    unless eids_from_api.empty?
      @events_data_from_fql = @graph.fql_query("select eid, name, creator, privacy, pic_small, pic_big, location, venue, start_time, end_time from event where eid in (#{eids_from_api.join(', ')})")
      @events = @events_data_from_fql.map { |efql| FacebookEvent.new(efql)}
       @events.reject! {|e| e.creator != current_user.facebook_uid }
#      #reject events not created by this user
       @events.reject! {|e| e.start_time < Time.now.to_i }
#      #reject past events
       @events.reject! {|e| e.privacy != "OPEN"}
#      #reject private events
    end
  end

  def import
    require_login!
    raise ActionController::RoutingError.new('Not found') if params[:eid].blank?
    @eid = params[:eid]
    @graph = Koala::Facebook::API.new(app_access_token)
    @multiquery = @graph.fql_multiquery({"event"=>"select eid, name, creator, privacy, pic_small, pic_big, location, venue, start_time, end_time from event where eid = #{@eid}","creator"=>"select name, pic_small, profile_url from user where uid in (select creator from #event)"})

    @event = FacebookEvent.new( @multiquery["event"][0] )
    @creator = TransientUser.new( @multiquery["creator"][0] )

#    raise ActionController::RoutingError.new("Esse evento é privado!") if @event.privacy != "OPEN" #reject private events
#    raise ActionController::RoutingError.new('Esse evento já passou!') if @event.end_time < Time.now.to_i #reject past events
#    raise ActionController::RoutingError.new("Esse evento não é seu!") if @event.creator != current_user.facebook_uid #reject events not created by this user

    @event_db = Event.find_or_initialize_by_fid(@event.eid)
    @event_db.attributes = {:user => current_user, :city => @city, :start_at => Time.at(@event.start_time).to_datetime, :end_at => Time.at(@event.end_time).to_datetime, :active => false}
    raise UnexpectedException unless @event_db.save
  end

  def create
    require_login!
    @event_db = Event.find(params[:id])
    @event_db.update_attributes(params[:event])
    if @event_db.valid?
      @event_db.update_attribute(:active, true)
      redirect_to @event_db
    else
      @graph = Koala::Facebook::API.new(app_access_token)
      @multiquery = @graph.fql_multiquery({"event"=>"select eid, name, creator, privacy, pic_small, pic_big, location, venue, start_time, end_time from event where eid = #{@event_db.fid}","creator"=>"select name, pic_small, profile_url from user where uid in (select creator from #event)"})
      @event = FacebookEvent.new( @multiquery["event"][0] )
      @creator = TransientUser.new( @multiquery["creator"][0] )
      render :action => "show"
    end
  end

  def edit
    require_login!
  end

  def update
    require_login!
  end

  def destroy
    require_login!
  end

end
