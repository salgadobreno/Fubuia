module AutoImporters
  class FubuiaImporter

    def self.run(options = {})
      #from = options[:from] || Date.today
      #to = options[:to] || 2.weeks.from_now

      fubuia = User.find_by_email "fubuia@fubuia.com.br"
      unless fubuia.present?
        Rails.logger.warn "PERFIL dO FUBA N DISPONIVEL"
        return
      end

      graph = Koala::Facebook::API.new(fubuia.oauth_token)

      all = graph.fql_query("select eid, name, creator, privacy, pic_small, pic_big, location, venue, start_time, end_time from event where eid in (SELECT eid FROM event_member WHERE uid=me())")

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

  end

end