source 'https://rubygems.org'
ruby '2.4.2'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'a9n'
gem 'bootstrap-sass'
gem 'coffee-rails'
gem 'devise'
gem 'devise-bootstrap-views'
gem 'font-awesome-rails'
gem 'haml-rails'
gem 'jbuilder'
gem 'jquery-rails'
gem 'kaminari'
gem 'omniauth-google-oauth2'
gem 'pg'
gem 'puma'
gem 'rails'
gem 'ransack'
gem 'sass-rails'
gem 'sidekiq'
gem 'simple_form'
gem 'turbolinks'
gem 'uglifier'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara'
  gem 'factory_bot'
  gem 'faker'
  gem 'rspec-rails'
  gem 'selenium-webdriver'
end

group :development do
  gem 'letter_opener'
  gem 'listen'
  gem 'spring'
  gem 'spring-watcher-listen'
  gem 'web-console'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
