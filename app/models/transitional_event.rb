require 'ostruct'
class TransitionalEvent < OpenStruct
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming


  def initialize(hash={})
    super(hash)
  end

  def persisted?
    false
  end

  def to_model
    self
  end

  def end_at
    @end_at || self.start_at
  end

  # EventCalendar uses this form of attribute access
  # faking AR behaviour
  def [](attr_name)
    self.instance_variable_get("@#{attr_name}")
  end

  def to_param
    "#{self.id}-#{self.name}"
  end

end
