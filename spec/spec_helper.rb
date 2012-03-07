# coding: UTF-8
# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'test_notifier/runner/rspec'
require 'capybara/rspec'
require 'authlogic/test_case'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  # ## Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false

  Capybara.javascript_driver = :webkit
  #config.filter_run_excluding :js => true
end

class ActiveRecord::Base
  mattr_accessor :shared_connection
  @@shared_connection = nil

  def self.connection
    @@shared_connection || retrieve_connection
  end
end
ActiveRecord::Base.shared_connection = ActiveRecord::Base.connection

def i18n(*params)
  I18n.t(*params)
end

def facebook_events_mocks
  connections_hash = [{"name"=>"Fim do Mundo - Eu vou!", "id"=>"105417699523664"}, {"name"=>"CAMPANHA: CID, DOE SEU SALÁRIO!", "id"=>"226420880736785"}, {"name"=>"LONDON CALLING Summer Edition**show com JOHNNY FLIRT e CASSINO SUPERNOVA",  "id"=>"317163524988819"}, {"name"=>"teste", "id"=>"372742442742194"}, {"name"=>"Festa na Cobe do China", "id"=>"228651767221196"}]
  fql_hash = JSON('[
                      {
                        "eid": 105417699523664,
                        "name": "Fim do Mundo - Eu vou!",
                        "creator": 1,
                        "privacy": "OPEN",
                        "location": "No mundo inteiro",
                        "venue": {
                          "street": "",
                          "city": "",
                          "state": "",
                          "country": ""
                        },
                        "start_time": 1327622400,
                        "end_time": 1327622400
                      },
                      {
                        "eid": 226420880736785,
                        "name": "CID, DOE SEU SALÁRIO!",
                        "creator": 100001678599737,
                        "privacy": "OPEN",
                        "location": "Ceará",
                        "venue": {
                          "street": "",
                          "city": "",
                          "state": "",
                          "country": ""
                        },
                        "start_time": 1328002200,
                        "end_time": 1328013000
                      },
                      {
                        "eid": 317163524988819,
                        "name": "LONDON CALLING",
                        "creator": 1,
                        "privacy": "OPEN",
                        "location": "Club 904 (Clube da ASCEB - 904 Sul)",
                        "venue": {
                          "street": "",
                          "city": "",
                          "state": "",
                          "country": "",
                          "latitude": -15.800694566667,
                          "longitude": -47.900688083333,
                          "id": 212762192067615
                        },
                        "start_time": 1327818600,
                        "end_time": 1327840200
                      },
                      {
                        "eid": 372742442742194,
                        "name": "teste",
                        "creator": 1,
                        "privacy": "SECRET",
                        "location": "Asd photographe",
                        "venue": {
                          "street": "",
                          "city": "",
                          "state": "",
                          "country": "",
                          "latitude": 48.508703720942,
                          "longitude": 2.463682145747,
                          "id": 242509969118609
                        },
                        "start_time": 1327586400,
                        "end_time": 1327597200
                      },
                      {
                        "eid": 228651767221196,
                        "name": "Festa na Cobe do China",
                        "creator": 1,
                        "privacy": "SECRET",
                        "location": "SQN 208 Bloco H",
                        "venue": {
                          "street": "",
                          "city": "",
                          "state": "",
                          "country": ""
                        },
                        "start_time": 1327201200,
                        "end_time": 1327217400
                      }
                    ]')
  #Fim do Mundo - Eu Vou! <- created by me, open, future
  #CID, DOE SEU SALÁRIO! <- not created by me, open, future
  #LONDON CALLING <- created by me, open, future
  #teste <- created by me, secret, future
  #Festa na Cobe do Chine <- not created by me, secret, past

  me = {'id' => '1','email' => 'eu@eu.com','name' => 'Breno Salgado'}

  today_mock = DateTime.civil(2012, 1, 26)
  Time.stubs(:now).returns(today_mock)
  Koala::Facebook::API.any_instance.stubs(:get_connections).with('me', 'events').returns(connections_hash)
  Koala::Facebook::API.any_instance.stubs(:fql_query).returns(fql_hash)
  Koala::Facebook::API.any_instance.stubs(:get_object).with('me').returns(me)
end

ActiveSupport::Deprecation.behavior = Proc.new { |message, callstack|
  raise message + "\n" + callstack.join("\n  ")
}
