module AutoImporters
  class FubuiaImporter

    def self.run(options = {})

      # Set user
      fubuia = User.find_by_email "fubuia@fubuia.com.br"
      unless fubuia.present?
        Rails.logger.warn "PERFIL dO FUBA N DISPONIVEL"
        return
      end

      #from = options[:from] || Date.today
      #to = options[:to] || 2.weeks.from_now
      graph = Koala::Facebook::API.new(fubuia.oauth_token)

      # get today's timeprint so we don't grab old events
      since = Time.now.to_i
      all = graph.fql_query(
        "SELECT
        eid, name, description, creator, privacy, pic_small, pic_big, location, venue, start_time, end_time
        FROM event WHERE eid IN
        (SELECT eid FROM event_member WHERE uid=me() AND start_time > #{since})"
      )

      # events we got from FB
      events = all.map { |efql| FacebookEvent.new(efql)}
      all_db_events_fids = Event.all.map(&:fid)

      #reject events we already have
      events.reject! {|e| all_db_events_fids.include? e.eid }

      #reject past events
      events.reject! {|e| Time.zone.parse(e.start_time) < Date.today.to_time }

      #reject private events
      events.reject! {|e| e.privacy.upcase != "OPEN" rescue true}

      city = City.first

      require 'term_relevancy'
      events.each do |event|

        Event.create_from_facebook(event, fubuia, city)

      end
    end

  end

#      tag_names = Tag.all.map(&:name)
#        event_db = Event.find_or_initialize_by_fid(event.eid)
#        event_db.attributes = {:user => fubuia.id, :city => City.first, :start_at => Time.zone.parse(event.start_time.to_s), :end_at => Time.zone.parse(event.end_time.to_s)}
#        #autotag
#        tr = TermRelevancy.new event.description, tag_names
#        tag_list = tr.rank.reject { |e| e[:relevancy] == 0 }.map { |e| e[:tag] }.compact.join(', ')
#        #/autotag
#
#        event_db.tag_list = tag_list
#        event_db.active = true
#
#        event_db.save!
end
