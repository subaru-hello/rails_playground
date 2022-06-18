# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Playground
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1
    config.generators do |g|  # ここから追記
      g.assets true         # CSS, JavaScriptファイル生成せず
      g.skip_routes true     # trueならroutes.rb変更せず、falseなら通常通り変更
      g.test_framework true  # testファイル生成せず
      g.helper true
    end     
    config.paths.add "#{Rails.root}/lib", eager_load: true

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
