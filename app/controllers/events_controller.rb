# coding: UTF-8
class EventsController < ApplicationController

  #garbage
  def comments
    render :file => "/events/commentsexample.html.erb"
  end

  def show
    @event_db = Event.find(params[:id])
    @graph = Koala::Facebook::API.new(app_access_token)
    @multiquery = @graph.fql_multiquery({"event"=>"select eid, name, creator, privacy, pic_small, pic_big, location, description, venue, start_time, end_time from event where eid = #{@event_db.fid}","creator"=>"select name, pic_small, profile_url from user where uid in (select creator from #event)"})
    @event = FacebookEvent.new(@multiquery['event'][0])
    @creator = TransientUser.new(@multiquery["creator"][0]) if @multiquery["creator"][0]

    if request.xhr?
      render :partial => "show"
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
      #       @events.reject! {|e| e.creator != current_user.facebook_uid }
      #       #reject events not created by this user
      #       @events.reject! {|e| e.start_time < Time.now.to_i }
      #       #reject past events
      #       @events.reject! {|e| e.privacy != "OPEN"}
      #       #reject private events
    end
  end

  def import
    require_login!
    raise ActionController::RoutingError.new('Not found') if params[:eid].blank?
    @eid = params[:eid]
    #@graph = Koala::Facebook::API.new(app_access_token)
    @graph = Koala::Facebook::API.new(current_user.access_token)
    @multiquery = @graph.fql_multiquery({"event"=>"select eid, name, creator, privacy, pic_small, pic_big, location, venue, start_time, end_time from event where eid = #{@eid}","creator"=>"select name, pic_small, profile_url from user where uid in (select creator from #event)"})

    @event = FacebookEvent.new( @multiquery["event"][0] )
    @creator = TransientUser.new( @multiquery["creator"][0] )

    #TODO: resolve this shit
    #    raise ActionController::RoutingError.new("Esse evento é privado!") if @event.privacy != "OPEN" #reject private events
    #    raise ActionController::RoutingError.new('Esse evento já passou!') if @event.end_time < Time.now.to_i #reject past events
    #    raise ActionController::RoutingError.new("Esse evento não é seu!") if @event.creator != current_user.facebook_uid #reject events not created by this user

    #@event_db = Event.find_or_initialize_by_fid(@event.eid)
    #TODO: why keep this?
    #@event_db.attributes = {:user => current_user, :city => @city, :start_at => Time.at(@event.start_time).to_datetime, :end_at => Time.at(@event.end_time).to_datetime }
    #@event_db.attributes = { :active => false } unless @event_db.active?
    #raise UnexpectedException unless @event_db.save
  end

  def create
    require_login!
    @graph = Koala::Facebook::API.new(current_user.access_token)

    @multiquery = @graph.fql_multiquery({"event"=>"select eid, name, creator, privacy, pic_small, pic_big, location, description, venue, start_time, end_time from event where eid = #{params[:id]}","creator"=>"select name, pic_small, profile_url from user where uid in (select creator from #event)"})

    @event = FacebookEvent.new( @multiquery["event"][0] )
    @creator = TransientUser.new( @multiquery["creator"][0] )

    @event_db = Event.find_or_initialize_by_fid(params[:id])
    @event_db.attributes = {:user => current_user, :city => @city, :start_at => Time.at(@event.start_time).to_datetime, :end_at => Time.at(@event.end_time).to_datetime}
    @event_db.tag_list = params[:event][:tag_list]

    if @event_db.save
      @event_db.update_attribute(:active, true)
      flash[:notice] = "Sucesso :)"
      render :action => "show"
    else
      #OPTIMIZE
      flash[:error] = "Puts! Deu algum problema... tenta denovo, se não resolver me avise plz."
      render :action => "import"
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
