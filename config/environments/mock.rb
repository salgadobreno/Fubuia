# coding: utf-8
Fubuia::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb
  config.after_initialize do
    load 'spec/support/dummy_responses.rb'
    Object.class_eval do
      include DummyResponses
    end


    connections_hash = [{"name"=>"Fim do Mundo - Eu vou!", "id"=>"105417699523664"}, {"name"=>"CAMPANHA: CID, DOE SEU SALÁRIO!", "id"=>"226420880736785"}, {"name"=>"LONDON CALLING Summer Edition**show com JOHNNY FLIRT e CASSINO SUPERNOVA",  "id"=>"317163524988819"}, {"name"=>"teste", "id"=>"372742442742194"}, {"name"=>"Festa na Cobe do China", "id"=>"228651767221196"}]

    date_today = Date.civil(2012, 1, 26)
    datetime_today = DateTime.civil(2012,1,26)
    time_today = Date.civil(2012,1,26)

    Time.stubs(:now).returns(time_today)
    DateTime.stubs(:now).returns(datetime_today)
    Date.stubs(:today).returns(date_today)


    Koala::Facebook::API.any_instance.stubs(:get_connections).with('me', 'events').returns(connections_hash)
    Koala::Facebook::API.any_instance.stubs(:fql_query).returns(events_query())

    def rand_time(from, to)
      Time.at(rand_in_range(from.to_f, to.to_f))
    end

    def rand_in_range(from, to)
      rand * (to - from) + from
    end

    random_tags = "rock, 0800, gls, open-bar, gospel, black, dubstep, brasiliacapitaldorock".split(',')
    events_query.each do |x|
      Factory.create(:event, :active => true, :city => City.first, :user => User.first, :fid => x["eid"], :start_at => rand_time(DateTime.now - 3.days, DateTime.now + 3.days), :tag_list => random_tags.sample(4).join(',') ) unless Event.where(fid:x["eid"]).present?
    end
  end

  # In the development environment your application's code is reloaded on
  # every request.  This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = true

  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin

  # Do not compress assets
  config.assets.compress = false

  # Expands the lines which load the assets
  config.assets.debug = true
end
