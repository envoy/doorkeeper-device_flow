require "doorkeeper/device_flow/version"
require "doorkeeper"

module Doorkeeper
  module DeviceFlow
    def resource_owner_from_assertion
      instance_eval(&Doorkeeper.configuration.resource_owner_from_assertion)
    end
  end

  module Orm
    module ActiveRecord
      def self.initialize_models!
        require 'doorkeeper/orm/active_record/device_access_grant'
        super
      end
    end
  end

  class Config
    option :device_verification_url
    option :device_polling_interval, default: 5
  end

  class Server
    def device_grant
      DeviceAccessGrant.by_token(parameters[:code])
    end
  end
end

require_relative "./oauth/authorization/device_code.rb"

require_relative "./oauth/device_code_request.rb"
require_relative "./oauth/device_code_response.rb"
require_relative "./oauth/device_pre_authorization.rb"
require_relative "./oauth/device_token_request.rb"
require_relative "./oauth/pre_authorization_mixin.rb"

require_relative "./orm/active_record/device_access_grant.rb"

require_relative "./rails/routes.rb"
