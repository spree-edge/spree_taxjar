module SpreeTaxjar
  class Engine < Rails::Engine
    require 'spree/core'
    require 'taxjar'

    config.autoload_paths += %W(#{config.root}/lib)

    isolate_namespace Spree
    engine_name 'spree_taxjar'

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), '../../app/**/*_decorator*.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end

      Dir.glob(File.join(File.dirname(__FILE__), '../../lib/taxjar/**/*_decorator*.rb')) do |c|
        Rails.application.config.cache_classes ? require(c) : load(c)
      end
    end

    config.after_initialize do |app|
      app.config.spree.calculators.tax_rates << ::Spree::Calculator::TaxjarCalculator
      SpreeTaxjar::Config = ::SpreeTaxjar::Configuration.new
      SpreeTaxjar::Logger = TaxjarHelper::TaxjarLog.new(STDOUT)
    end

    config.to_prepare &method(:activate).to_proc
  end
end
