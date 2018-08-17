source 'https://rubygems.org'
ruby '2.4.2'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'bootstrap-sass'
gem 'coffee-rails'
gem 'devise'
gem 'devise-bootstrap-views'
gem 'draper'
gem 'faker'
gem 'font-awesome-sass'
gem 'i18n'
gem 'jbuilder'
gem 'jquery-rails'
gem 'omniauth-google-oauth2'
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
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'letter_opener'
  gem 'listen'
  gem 'pry-byebug'
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
