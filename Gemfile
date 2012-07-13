source 'http://rubygems.org'

gem 'rails', '~> 3.2.1'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'mysql2'
gem 'execjs'
gem 'therubyracer'
gem 'koala'
gem 'authlogic'
gem 'twitter-bootstrap-rails'
#gem 'cancan'
#gem 'activeadmin'
gem 'acts-as-taggable-on', :git => "http://github.com/mbleigh/acts-as-taggable-on.git" #removing git:// link cause of the shitty proxies here
#gem 'event-calendar', :require => 'event_calendar', :git => "/home/buzaga/Dropbox/railsapps/event_calendar.git"
gem 'event-calendar', :require => 'event_calendar', :path => 'vendor/event_calendar'

group :development do
  gem 'awesome_print'
  gem 'localtunnel'
end

group :test, :development do
  gem 'debugger'
  gem 'rspec-rails', '~> 2.6'
  #gem 'ZenTest'
  #gem 'autotest-rails'
  gem 'test_notifier'
  gem 'mocha'
end

group :mock do
  gem 'awesome_print'
  gem 'debugger'
  gem 'factory_girl_rails'
  gem 'mocha'
end

group :test do
  gem 'factory_girl_rails'
  gem 'mocha'
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'launchy'
end


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

