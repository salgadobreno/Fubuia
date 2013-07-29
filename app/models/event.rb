# coding: UTF-8
class Event < ActiveRecord::Base

  has_event_calendar
  acts_as_ordered_taggable

  belongs_to :city
  belongs_to :user

  validates :city, :presence => true
  validates :fid, :presence => true
  validates :start_at, :presence => true
  validate :cant_end_before_it_starts

  before_save :defaults_end_at_to_start_at
  before_save :really_multiday?

  scope :for_date_range, lambda {|start_d, end_d| where(["(start_at < ?) AND (end_at >= ?)", end_d, start_d]).order("start_at ASC") }
  scope :tagged_with, lambda {|tag_id| joins(:tags).where(["taggings.tag_id = ?", tag_id])}
  scope :active, lambda { where(:active => true) }


  def attributes_for_facebook_event
    #Used when overlaying transient events with DB one
    attrs = attributes.select {|k,v| ['id','start_at','end_at'].include?(k)}
    attrs["css_class"] = self.tags.first.try(:css_class)
    attrs
  end

  def deactivate!
    self.active = false
    save
  end

  def self.pull_and_create(fid, user, city)
    if fid =~ /facebook.*\d/ # facebook url with event id
      url = fid
      fid = url[/(\d+)/]
    end
    graph = Koala::Facebook::API.new(user.oauth_token)
    result = graph.fql_query(
      "SELECT
      eid, name, description, creator, privacy, pic_small, pic_big,
      location, venue, start_time, end_time
      FROM event WHERE eid = #{fid}"
    )
    if result[0]
      event = FacebookEvent.new(result[0])
      create_from_facebook(event, user, city)
    else
      nil
    end
  end

  require 'term_relevancy'
  def self.create_from_facebook(event, user = default_user(), city)
    event_db = Event.find_or_initialize_by_fid(event.eid)
    event_db.attributes = {
      :name => event.name,
      :user => user,
      :city => city,
      :start_at => Time.zone.parse(event.start_time.to_s),
      :end_at => Time.zone.parse(event.end_time.to_s)
    }
    #autotag
    tr = TermRelevancy.new event.description, Tag.all.map(&:name)
    tag_list = tr.rank.reject { |e| e[:relevancy] == 0 }.map { |e| e[:tag] }.compact.join(', ')
    #/autotag

    event_db.tag_list = tag_list
    event_db.active = true

    event_db.save
  end

  private

  def cant_end_before_it_starts
    if self.start_at && self.end_at
      errors.add(:end_at, I18n.t('errors.messages.event.end_before_start')) if self.start_at > self.end_at
    end
  end

  def defaults_end_at_to_start_at
    self.end_at = self.start_at if self.end_at.blank?
  end

  def really_multiday?
    unless self.end_at.blank?
      unless self.end_at.to_date === self.start_at.to_date
        diff = ((self.end_at.to_i - self.start_at.to_i) / 60) / 60
        really = diff > 12

        unless really
          self.end_at = self.start_at
        end
      end
    end
  end

end
