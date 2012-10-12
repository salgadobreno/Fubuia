desc "importa os eventos do breno"
task :importa => :environment  do

  buzaga = User.find_by_email "salgado.breno@gmail.com"
  unless buzaga.present?
    Rails.logger.warn "PERFIL dO BRENO N DISPONIVEL"
    return
  end
  @graph = Koala::Facebook::API.new(buzaga.oauth_token)

  @all_fucking_events = @graph.fql_query("select eid, name, creator, privacy, pic_small, pic_big, location, venue, start_time, end_time from event where eid in (SELECT eid FROM event_member WHERE uid=me())")

  @events = @all_fucking_events.map { |efql| FacebookEvent.new(efql)}
  @events.reject! {|e| Time.zone.parse(e.start_time) < Time.now } #XXX danger
  @events.reject! {|e| e.privacy.upcase != "OPEN"}
  #reject private events
  @events.each do |event|

    event_db = Event.find_or_initialize_by_fid(event.eid)
    event_db.attributes = {:user => buzaga, :city => City.first, :start_at => Time.zone.parse(event.start_time.to_s), :end_at => Time.zone.parse(event.end_time.to_s)}
    event_db.active = true

    event_db.save!
  end

end
