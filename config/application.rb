require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Memonto
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # deviseの日本語化
    config.i18n.default_locale = :ja

    # アプリケーションの日本語化
    config.i18n.load_path += Dir[Rails.root.join("config/locales/*.yml").to_s]

    # タイムゾーンを変更
    config.time_zone = "Tokyo"

    # field_with_errorsクラスのdivを自動挿入されないようにする
    config.action_view.field_error_proc = Proc.new { |html_tag, instance| html_tag }


    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
