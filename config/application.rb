require_relative 'boot'

require 'csv'
require 'rails/all'

Bundler.require(*Rails.groups)

module FastFlashcards
  class Application < Rails::Application
    config.load_defaults 5.1 
    config.generators do |g|
      g.helper           false
      g.javascripts      false
      g.stylesheets      false
      g.integration_tool :rspec
      g.test_framework   :rspec
    end
  end
end
