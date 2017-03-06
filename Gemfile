source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.1'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

gem 'haml-rails'
gem 'kaminari'
gem 'devise'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'omniauth-google'
gem 'omniauth-github'

gem 'rectify'
gem 'wicked'
gem 'ffaker'
gem 'rails_admin'
gem 'rails_admin_aasm'
gem 'cancancan'

group :development, :test do
  gem 'byebug'
  gem 'factory_girl_rails'
  gem 'letter_opener_web'
  gem 'rspec-rails'
  gem 'wisper-rspec'
  gem 'with_model'
  gem 'rails-controller-testing'
  gem 'capybara'
  gem 'capybara-email'
  gem 'capybara-screenshot'
  gem 'database_cleaner'
  gem 'poltergeist'
  gem 'shoulda'
  gem 'shoulda-matchers'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
