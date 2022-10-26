source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

gem 'bcrypt', '3.1.18'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'bootstrap-sass', '~> 3.4.1'
gem 'jbuilder', '~> 2.7'
gem 'net-smtp', require: false
gem 'net-imap', require: false
gem 'net-pop', require: false
gem 'psych', '< 4'
gem 'puma', '~> 4.1'
gem 'rails', '~> 6.0.6'
gem 'sass-rails', '>= 6'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 4.0'

group :development, :test do
  gem 'byebug'
  gem 'sqlite3', '~> 1.4'
end

group :development do
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'minitest'
  gem 'minitest-reporters'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

group :production do
  gem 'pg', '1.4.4'
end

gem 'tzinfo-data'
