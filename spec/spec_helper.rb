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

  config.include FactoryGirl::Syntax::Methods
  config.include Capybara::DSL
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

  #load seed
  config.before(:suite) do
    load "#{Rails.root}/db/seeds.rb"
  end

  config.before type: :request do
    OmniAuth.config.test_mode = true
    Koala::Facebook::API.any_instance.stubs(:fql_query).returns({})
    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
      :provider => 'facebook',
      :uid => '1234567',
      :info => {
        :email => 'salgado@breno.com',
        :name => 'Breno Salgado',
      },
      :credentials => {
        :token => 'ABCDEF...',
        :expires_at => 1321747205,
        :expires => true
      }
    })
  end

  config.around(:each, :subdomain => 'rio') do |example|
    Capybara.current_session.reset!
    Capybara.default_host = 'http://rio.example.com'
    example.run
    Capybara.default_host = 'http://www.example.com'
    Capybara.current_session.reset!
  end

  config.around(:each, :subdomain => 'brasilia') do |example|
    Capybara.current_session.reset!
    Capybara.default_host = 'http://brasilia.example.com'
    example.run
    Capybara.default_host = 'http://www.example.com'
    Capybara.current_session.reset!
  end

  # WebServices response mocks
  config.include DummyResponses

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

ActiveSupport::Deprecation.behavior = Proc.new { |message, callstack|
  raise message + "\n" + callstack.join("\n  ")
}
