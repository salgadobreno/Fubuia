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

    @tags = Rails.cache.fetch "tags-#{Date.today.to_s}-#{Tagging.most_recent_created_at.to_i}" do
      Tag.event_tags_for_date_range(Date.today - 3 + @shift, Date.today + 3 + @shift).in_city(@city)
    end

    @tag = Tag.find_by_name(params[:tag]) if params[:tag].present?
    flash[:error] = "Tag não encontrada" if params[:tag].present? && @tag.nil?

    @events = Rails.cache.fetch "events-#{Date.today.to_s}-#{Event.most_recent_updated_at.to_i}" do

      events = @city.events.for_date_range(strip_start, strip_end + 1).active # ?
      events = events.active.tagged_with(@tag) if @tag

      query = "select eid, name, description, creator, privacy, pic_small, pic_big, location, venue, start_time, end_time from event where eid in (%s)" % events.map(&:fid).join(',')

      @graph = Koala::Facebook::API.new(app_access_token)
      event_hashes = Hash[events.map { |e| [e.fid, e] }] #1
      events_from_fql = @graph.fql_query(query)
      @events = events_from_fql.map do |efql| #2
        FacebookEvent.new(efql.merge( event_hashes[efql["eid"]].attributes_for_facebook_event )) unless event_hashes[efql["eid"]].blank?
      end.compact
    end

    @event_strips = Event.create_event_strips(strip_start, strip_end, @events)

  end

end
