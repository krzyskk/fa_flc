require_relative 'boot'

require 'csv'
require 'rails/all'

Bundler.require(*Rails.groups)

module FastFlashcards
  class Application < Rails::Application
    config.load_defaults 5.1
  end
end
