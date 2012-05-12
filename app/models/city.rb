class City < ActiveRecord::Base

  has_many :events

  validates :name, :presence => true
  validates :subdomain, :presence => true

end
