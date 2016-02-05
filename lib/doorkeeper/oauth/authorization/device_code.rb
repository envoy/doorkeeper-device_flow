module Doorkeeper
  module OAuth
    module Authorization
      class DeviceCode
        attr_accessor :pre_auth, :token

        def initialize(pre_auth, token=nil)
          @pre_auth = pre_auth
          @token = token
        end

        def issue_token!
          DeviceAccessGrant.create!(
            application_id: pre_auth.client.id,
            expires_in: configuration.authorization_code_expires_in,
            scopes: pre_auth.scopes.to_s
          )
        end

        def issue_token
          @token ||= issue_token!
        end

        def configuration
          Doorkeeper.configuration
        end
      end
    end
  end
end
