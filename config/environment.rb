# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!
A9n.root = File.expand_path('../..', __FILE__)
A9n.load
