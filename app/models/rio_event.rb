class RioEvent < TransitionalEvent

  #attr_accessor :name, :short_text, :text, :url
  #attr_accessor :email, :website, :phone
  #attr_accessor :price, :lgbt, :general_info
  #attr_accessor :organization, :local
  #attr_accessor :file
  #attr_accessor :neighbourhood
  #attr_accessor :address
  #attr_accessor :lng, :lat
  #attr_accessor :start_date, :end_date

  def initialize(hash={})
    h = Hash[hash]
    h.merge!( h.delete('description') { {} })
    h.merge!( h.delete('contactData') { {} })
    h.merge!( h.delete('characteristics') { {} })
    h.merge!( h.delete('geoResult') { {} })
    super(h)
  end
end
