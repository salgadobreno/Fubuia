# coding: UTF-8
class EventsController < ApplicationController

  def show
    @event_db = Event.find(params[:id])
    @graph = Koala::Facebook::API.new(app_access_token)
    @multiquery = @graph.fql_multiquery({"event"=>"select eid, name, creator, privacy, pic_small, pic_big, location, venue, start_time, end_time from event where eid = #{@event_db.fid}","creator"=>"select name, pic_small, profile_url from user where uid in (select creator from #event)"})
    @event = TransitionalEvent.new(@multiquery['event'][0])
    @creator = TransitionalUser.new(@multiquery["creator"][0]) if @multiquery["creator"][0]
  end

  def comments
    render :file => "/events/commentsexample"
  end

  def new
    render :file => "/events/new"
  end

  def start_import
    #TODO: 0 events check
    @graph = Koala::Facebook::API.new(current_user.access_token)
    user_events_from_api = @graph.get_connections('me', 'events')
    eids_from_api = user_events_from_api.map {|e| e["id"]}
    unless eids_from_api.empty?
      @events_data_from_fql = @graph.fql_query("select eid, name, creator, privacy, pic_small, pic_big, location, venue, start_time, end_time from event where eid in (#{eids_from_api.join(', ')})")
      @events = @events_data_from_fql.map { |efql| TransitionalEvent.new(efql)}
      @events.reject! {|e| e.creator != current_user.facebook_uid }
      #reject events not created by this user
      @events.reject! {|e| e.start_time < Time.now.to_i }
      #reject past events
      @events.reject! {|e| e.privacy != "OPEN"}
      #reject private events
    end
  end

  def import
    raise ActionController::RoutingError.new('Not found') if params[:eid].blank?
    @eid = params[:eid]
    @graph = Koala::Facebook::API.new(app_access_token)
    @multiquery = @graph.fql_multiquery({"event"=>"select eid, name, creator, privacy, pic_small, pic_big, location, venue, start_time, end_time from event where eid = #{@eid}","creator"=>"select name, pic_small, profile_url from user where uid in (select creator from #event)"})

    @event = TransitionalEvent.new( @multiquery["event"][0] )
    @creator = TransitionalUser.new( @multiquery["creator"][0] )

    raise ActionController::RoutingError.new("Esse evento é privado!") if @event.privacy != "OPEN" #reject private events
    raise ActionController::RoutingError.new('Esse evento já passou!') if @event.end_time < Time.now.to_i #reject past events
    raise ActionController::RoutingError.new("Esse evento não é seu!") if @event.creator != current_user.facebook_uid #reject events not created by this user

    @event_db = Event.find_or_initialize_by_fid(@event.eid)
    @event_db.attributes = {:user => current_user, :start_at => Time.at(@event.start_time).to_datetime, :end_at => Time.at(@event.end_time).to_datetime, :active => false}
    raise UnexpectedException unless @event_db.save
  end

  def create
    @event_db = Event.find(params[:id])
    @event_db.update_attributes(params[:event])
    if @event_db.valid?
      @event_db.update_attribute(:active, true)
      redirect_to @event_db
    else
      @graph = Koala::Facebook::API.new(app_access_token)
      @multiquery = @graph.fql_multiquery({"event"=>"select eid, name, creator, privacy, pic_small, pic_big, location, venue, start_time, end_time from event where eid = #{@event_db.fid}","creator"=>"select name, pic_small, profile_url from user where uid in (select creator from #event)"})
      @event = TransitionalEvent.new( @multiquery["event"][0] )
      @creator = TransitionalUser.new( @multiquery["creator"][0] )
      render :action => "show"
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

end
