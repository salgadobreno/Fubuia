#coding: utf-8
class CalendarController < ApplicationController

  def index
    #used by calendar helper
    @month = Time.zone.now.month
    @year = Time.zone.now.year
    #// lotsa variables
    @shift = params[:shift].to_i
    strip_start = Date.today - 3 + @shift
    strip_end = Date.today + 4 + @shift

    @tags = Tag.tag_counts_for_date_range('tags', Date.today - 3 + @shift, Date.today + 3 + @shift)


    @tag = Tag.find_by_name(params[:tag]) if params[:tag].present?
    flash[:error] = "Tag não encontrada" if params[:tag].present? && @tag.nil?

    events = Event.events_for_date_range(strip_start, strip_end).active
    events = events.active.tagged_with(@tag) if @tag

    query = "select eid, name, creator, privacy, pic_small, pic_big, location, venue, start_time, end_time from event where eid in (%s)" % events.map(&:fid).join(',')

    @graph = Koala::Facebook::API.new(app_access_token)
    event_hashes = Hash[events.map { |e| [e.fid, e] }]
    events_from_fql = @graph.fql_query(query)
    @events = events_from_fql.map do |efql|
      FacebookEvent.new(efql.merge( event_hashes[efql["eid"]].attributes_for_facebook_event )) unless event_hashes[efql["eid"]].blank?
    end.compact

    @event_strips = Event.create_event_strips(strip_start, strip_end, @events)

    #rioevents

    @rioapi = RioApi.new
    @rioapi.retrieve_token!
    @rio_events = @rioapi.get_eventos('start-date'=>Date.today.to_s,'end-date'=>Date.today.advance(:weeks => 2).to_s)['results']
    @rio_events = @rio_events.map {|re| RioEvent.new(re)}

  end

end
