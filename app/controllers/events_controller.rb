# coding: UTF-8
class EventsController < ApplicationController

  caches_action :show, :cache_path => Proc.new {|c| { :xhr => request.xhr? }.merge c.params }

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
    @graph = Koala::Facebook::API.new(current_user.oauth_token)
    @events_data_from_fql = @graph.fql_query("select eid, name, creator, privacy, pic_small, pic_big, location, venue, start_time, end_time from event where eid in (SELECT eid FROM event_member WHERE uid=me())")
    @events = @events_data_from_fql.map { |efql| FacebookEvent.new(efql)}
    #@events.reject! {|e| e.creator != current_user.facebook_uid }
    ##reject events not created by this user
    @events.reject! {|e| Time.zone.parse(e.start_time) < Time.now } #XXX danger
    ##reject past events
    @events.reject! {|e| e.privacy.upcase != "OPEN"}
    #reject private events

    @events.sort_by! {|e| e.start_time}
  end

  def import
    require_login!
    raise ActionController::RoutingError.new('Not found') if params[:eid].blank?
    @eid = params[:eid]
    #@graph = Koala::Facebook::API.new(app_access_token)
    @graph = Koala::Facebook::API.new(current_user.oauth_token)
    @multiquery = @graph.fql_multiquery({"event"=>"select eid, name, creator, privacy, pic_small, pic_big, location, venue, start_time, end_time from event where eid = #{@eid}","creator"=>"select name, pic_small, profile_url from user where uid in (select creator from #event)"})

    @event = FacebookEvent.new( @multiquery["event"][0] )
    @creator = TransientUser.new( @multiquery["creator"][0] )

    #TODO: resolve this shit
    raise ActionController::RoutingError.new("Esse evento é privado!") if @event.privacy != "OPEN" #reject private events
    #    raise ActionController::RoutingError.new('Esse evento já passou!') if @event.end_time < Time.now.to_i #reject past events XXX danger
    #    raise ActionController::RoutingError.new("Esse evento não é seu!") if @event.creator != current_user.facebook_uid #reject events not created by this user

    #@event_db = Event.find_or_initialize_by_fid(@event.eid)
    #TODO: why keep this?
    #@event_db.attributes = {:user => current_user, :city => @city, :start_at => Time.at(@event.start_time).to_datetime, :end_at => Time.at(@event.end_time).to_datetime }
    #@event_db.attributes = { :active => false } unless @event_db.active?
    #raise UnexpectedException unless @event_db.save

    if request.xhr?
      render :partial => "import", :layout => false
    end
  end

  #TODO possible security flaw here
  def create
    require_login!
    @graph = Koala::Facebook::API.new(current_user.oauth_token)

    @multiquery = @graph.fql_multiquery({"event"=>"select eid, name, creator, privacy, pic_small, pic_big, location, description, venue, start_time, end_time from event where eid = #{params[:id]}","creator"=>"select name, pic_small, profile_url from user where uid in (select creator from #event)"})

    @event = FacebookEvent.new( @multiquery["event"][0] )
    @creator = TransientUser.new( @multiquery["creator"][0] )

    @event_db = Event.find_or_initialize_by_fid(params[:id])
    @event_db.attributes = {:user => current_user, :city => @city, :start_at => Time.zone.parse(@event.start_time.to_s), :end_at => Time.zone.parse(@event.end_time.to_s)}
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
