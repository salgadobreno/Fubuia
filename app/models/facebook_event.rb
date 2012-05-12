class FacebookEvent < TransientEvent

  #attr_accessor :eid, :name, :privacy, :pic_small, :pic_big, :location, :venue, :start_time, :end_time, :end_time
  #attr_accessor :creator #not sure if useful
  ##for db event overlay
  #attr_accessor :id, :start_at, :end_at

  include EventCalendar::InstanceMethods

  def to_param
    "#{self.id}-#{self.name}".gsub(' ', '-')
  end

end
