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

    @graph = Koala::Facebook::API.new(app_access_token)

    @tag = Tag.find_by_name(params[:tag]) if params[:tag].present?
    flash[:error] = "Tag não encontrada" if params[:tag].present? && @tag.nil?

    events = Event.events_for_date_range(strip_start, strip_end).active

    events = events.active.tagged_with(@tag) if @tag

    query = "SELECT eid,name FROM event WHERE eid in (%s)" % events.map(&:fid).join(',')

    event_hashes = {}
    event_hashes = @graph.fql_query(query) unless events.empty?

    filtered_events = events.each do |e|
      event_hashes.each do |fe|
        e.define_singleton_method(:name) { fe["name"] } if fe.rassoc(e.fid)
      end
    end.reject {|x| !x.respond_to?(:name)}
    @event_strips = Event.create_event_strips(strip_start, strip_end, filtered_events)

  end

end
