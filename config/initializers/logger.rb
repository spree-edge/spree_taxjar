SpreeTaxjar::Logger = TaxjarHelper::TaxjarLog.new(STDOUT)
SpreeTaxjar::Logger.logger.extend(ActiveSupport::Logger.broadcast(Rails.logger))
