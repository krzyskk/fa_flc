source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'bootstrap'
gem 'devise'
gem 'draper'
gem 'faraday'
gem 'faker'
gem 'font-awesome-sass'
gem 'i18n'
gem 'jbuilder'
gem 'jquery-rails'
gem 'json', '~> 2.1'
gem 'omniauth-google-oauth2', '~> 0.5.3'
gem 'pg'
gem 'puma'
gem 'rails'
gem 'ransack'
gem 'sass-rails'
gem 'simple_form'
gem 'slim'
gem 'turbolinks'
gem 'uglifier'

group :development do
  gem 'annotate'
  gem 'better_errors'
  gem "binding_of_caller"
  gem 'letter_opener'
  gem 'listen'
  gem 'pry-byebug'
  gem 'rails-erd'
  gem 'rubocop', require: false
  gem 'spring'
  gem 'spring-watcher-listen'
  gem 'web-console'
end

group :test do
  gem 'factory_bot_rails'
  gem 'rspec-rails', '~> 3.6'
  gem 'shoulda-matchers', git: 'https://github.com/thoughtbot/shoulda-matchers.git'
end
