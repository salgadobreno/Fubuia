module AutoImporters
  class FubuiaImporter

    def self.run(options = {})
      logger.info "Importer running"

      # Set user
      fubuia = User.find_by_email "fubuia@fubuia.com.br"
      unless fubuia.present?
        logger.warn "PERFIL dO FUBA N DISPONIVEL"
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
      hash_log = {:returned => events.count, :created => []}
      events.each do |event|

        if Event.create_from_facebook(event, fubuia, city)
          hash_log[:created] << 1
        end

      end
      logger.info "Done."
      logger.info "Returned: #{hash_log[:returned]}"
      logger.info "Created: #{hash_log[:created].count}"
    end

    def self.logger
      logfile = File.open('./log/imports.log', 'a')
      logfile.sync = true
      log = ImporterLogger.new(logfile)
    end

  end

  class ImporterLogger < Logger
    def format_message(severity, timestamp, progname, msg)
      "#{timestamp.to_formatted_s(:db)} #{severity} #{msg}\n"
    end
  end

end
