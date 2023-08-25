# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

if defined?(Rails::Server) && Rails.env.development?
  require "debug/open_nonstop"
end

Bundler.require(*Rails.groups)

module FashionStore
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0
    config.assets.paths << Rails.root.join('app', 'assets', 'fonts')

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
