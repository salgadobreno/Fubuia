class Event < ActiveRecord::Base

  has_event_calendar
  acts_as_taggable

  validates :fid, :presence => true
  validates :start_at, :presence => true
  validate :cant_end_before_it_starts

  before_save :defaults_end_at_to_start_at

  scope :events_for_date_range, lambda {|start_d, end_d| where(["(start_at < ?) AND (end_at >= ?)", end_d, start_d]).order("start_at ASC") }
  scope :tagged_with, lambda {|tag_id| joins(:tags).where(["taggings.tag_id = ?", tag_id])}
  scope :active, lambda { where(:active => true) }


  def attributes_for_facebook_event
    attributes.select {|k,v| ['id','start_at','end_at'].include?(k)}
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

end
