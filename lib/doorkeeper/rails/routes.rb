require 'doorkeeper/rails/routes/mapping'
require 'doorkeeper/rails/routes/mapper'

module Doorkeeper
  module Rails
    class Routes
      def generate_routes!(options)
        scope = super(options)
        scope.map_route(:devices, :device_routes)
        scope
      end

      private

      def device_routes(mapping)
        routes.resource(
          :device,
          path: 'device',
          only: [:create],
          as: mapping[:as],
          controller: mapping[:controllers]
        )
      end
    end
  end
end
