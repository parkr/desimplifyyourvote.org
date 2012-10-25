source 'https://rubygems.org'

gem 'rails', '3.2.8'

gem 'pg', "~> 0.14.1"
gem 'devise', '>= 2.1'
gem 'thin'
gem 'exception_notification', :require => 'exception_notifier'
gem "capistrano-ext", "~> 1.2.1"
gem 'capistrano-nginx'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'jquery-rails'
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby

  gem 'compass-rails', '~> 1.0.3'
  gem 'compass-cornell-plugin', '~> 0.2.1'

  gem 'uglifier', '>= 1.0.3'
end

gem "rspec-rails", :group => [:test, :development]
group :test do
  gem "factory_girl_rails", "~> 4.0"
  gem "capybara"
  gem "guard-rspec"
  gem "rb-fsevent", "~> 0.9.1"
end

# To use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
