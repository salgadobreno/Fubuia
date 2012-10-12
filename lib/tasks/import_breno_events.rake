desc "importa os eventos do breno"
task :importa => :environment  do

  buzaga = User.find_by_email "salgado.breno@gmail.com"
  unless buzaga.present?
    Rails.logger.warn "PERFIL dO BRENO N DISPONIVEL"
    return
  end
  graph = Koala::Facebook::API.new(buzaga.oauth_token)

  events = all.map { |efql| FacebookEvent.new(efql)}
  events.map(&:eid).reject! {|eid| Event.all.map(&:fid).include? eid}
  #reject events we already have
  #TODO: add autotag
  events.reject! {|e| Time.zone.parse(e.start_time) < Date.today.to_time }
  #reject past events
  events.reject! {|e| e.privacy.upcase != "OPEN"}
  #reject private events
  events.each do |event|

    event_db = Event.find_or_initialize_by_fid(event.eid)
    event_db.attributes = {:user => fubuia, :city => City.first, :start_at => Time.zone.parse(event.start_time.to_s), :end_at => Time.zone.parse(event.end_time.to_s)}
    event_db.active = true

    event_db.save!
  end

end
