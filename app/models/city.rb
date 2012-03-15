class City < ActiveRecord::Base

  validates :name, :presence => true
  validates :subdomain, :presence => true

end
