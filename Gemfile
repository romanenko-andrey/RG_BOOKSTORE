source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
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
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'

gem 'cancancan'
gem 'carrierwave', '~> 1.0'
gem 'devise'
gem 'font-awesome-sass'
gem 'haml-rails'
gem 'kaminari'
gem 'maruku'
gem 'mini_magick'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'omniauth-github'
gem 'omniauth-google'
gem 'rails_admin', '~> 1.1.1'
gem 'rails_admin_aasm'
gem 'rectify'
gem 'wicked'

group :development, :test do
  gem 'byebug'
  gem 'capybara'
  gem 'capybara-email'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'ffaker'
  gem 'poltergeist'
  gem 'rails-controller-testing'
  gem 'rspec-rails'
  gem 'shoulda'
  gem 'shoulda-matchers'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
