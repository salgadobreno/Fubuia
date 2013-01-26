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

      all = graph.fql_query("select eid, name, description, creator, privacy, pic_small, pic_big, location, venue, start_time, end_time from event where eid in (SELECT eid FROM event_member WHERE uid=me())")

      events = all.map { |efql| FacebookEvent.new(efql)}
      all_db_events_fids = Event.all.map(&:fid)
      events.reject! {|e| all_db_events_fids.include? e.eid }
      #reject events we already have
      events.reject! {|e| Time.zone.parse(e.start_time) < Date.today.to_time }
      #reject past events
      events.reject! {|e| e.privacy.upcase != "OPEN" rescue true}
      #reject private events
      tag_names = Tag.all.map(&:name)

      require 'term_relevancy'
      events.each do |event|

        event_db = Event.find_or_initialize_by_fid(event.eid)
        event_db.attributes = {:user => fubuia.id, :city => City.first, :start_at => Time.zone.parse(event.start_time.to_s), :end_at => Time.zone.parse(event.end_time.to_s)}
        #autotag
        tr = TermRelevancy.new event.description, tag_names
        tag_list = tr.rank.reject { |e| e[:relevancy] == 0 }.map { |e| e[:tag] }.compact.join(', ')
        #/autotag

        event_db.tag_list = tag_list
        event_db.active = true

        event_db.save!
      end
    end

  end

end
