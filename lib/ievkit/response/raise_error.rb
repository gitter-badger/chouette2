require 'faraday'
require 'ievkit/error'

module Ievkit
  # Faraday response middleware
  module Response

    # This class raises an Ievkit-flavored exception based
    # HTTP status codes returned by the API
    class RaiseError < Faraday::Response::Middleware

      private

      def on_complete(response)
        if error = Ievkit::Error.from_response(response)
          raise error
        end        
      end
    end
  end
end
