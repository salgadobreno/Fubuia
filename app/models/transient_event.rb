require 'ostruct'
class TransientEvent < OpenStruct
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

  # EventCalendar uses this form of attribute access
  # faking AR behaviour
  def [](attr_name)
    self.instance_variable_get("@#{attr_name}")
  end

end
