module Taxjar
  module API
    module RequestDecorator
      def set_http_timeout
        @http_timeout = {}

        %i[connect write read].each do |method|
          @http_timeout[method] = @options[:timeout] || ::Spree::Config[:taxjar_timeout]
        end
      end
    end
  end
end

Taxjar::API::Request.prepend Taxjar::API::RequestDecorator
