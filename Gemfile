source 'http://rubygems.org'

gem 'rails'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

#gem 'unicorn'
#gem 'pg'

gem 'rack-escaped-fragment', :git => 'git@github.com:salgadobreno/rack-escaped-fragment.git'

#gem 'hitchens'
gem 'activeadmin'
gem 'jquery-ui-rails' #for activeadmin
gem 'omniauth-facebook'
gem 'whenever', :require => false

gem 'mysql2'
gem 'execjs'
gem 'therubyracer'
gem 'koala'
gem 'authlogic'
gem 'twitter-bootstrap-rails'
gem 'acts-as-taggable-on', :git => "http://github.com/mbleigh/acts-as-taggable-on.git" #removing git:// link cause of the shitty proxies here
gem 'event-calendar', :require => 'event_calendar', :path => 'vendor/event_calendar'

#gem 'cancan'
#gem 'event-calendar', :require => 'event_calendar', :git => "/home/buzaga/Dropbox/railsapps/event_calendar.git"

gem 'sitemap_generator'

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
  gem 'htmlentities', :require => "htmlentities"
end


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'less-rails'
  gem 'coffee-rails'
  gem 'uglifier'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server

# Deploy with Capistrano
#gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'
