module SpreeTaxjar
  class Configuration < ::Spree::Preferences::Configuration
    preference :taxjar_api_key, :string
    preference :taxjar_enabled, :boolean, default: false
    preference :taxjar_debug_enabled, :boolean, default: false
    preference :taxjar_sandbox_environment_enabled, :boolean, default: false
    preference :taxjar_timeout, :float, default: 2.0
  end
end
