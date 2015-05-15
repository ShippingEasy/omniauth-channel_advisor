require 'omniauth/strategies/oauth2'

module OmniAuth
  module Strategies
    class ChannelAdvisor < OmniAuth::Strategies::OAuth2
      option :name, "channel_advisor"
      option :client_options, {
          :site => 'https://api.channeladvisor.com',
          :authorize_url => '/oauth2/authorize',
          :token_url => '/oauth2/token'
      }

      # scope: 'orders inventory' - http://developers.channeladvisor.com/rest/#638
      # access_type: 'offline'    - retrieve a refresh token http://developers.channeladvisor.com/rest/#917
      # approval_prompt: 'force'  - always show grant screen http://developers.channeladvisor.com/rest/#917
      option :authorize_options, [:scope, :access_type, :approval_prompt]

      NAME_KEY = "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name".freeze
      UID_KEY = "urn:ca:claim:profile".freeze

      uid{ info_hash[UID_KEY] }

      info do
        {
          :name => info_hash[NAME_KEY]
        }
      end

      extra do
        {
          'raw_info' => raw_info
        }
      end

      def info_hash
        @info_hash ||= Array(raw_info).each_with_object({}){|item, result|
          key = item["Type"]
          val = item["Value"]
          result[key] = val if (key && val)
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/oauth2/identity').parsed
      end

      # Example response from identity endpoint
      #
      # [
      #   {
      #     "$id": "1",
      #     "Type": "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name",
      #     "Value": "MyStore"
      #   },
      #   {
      #     "$id": "2",
      #     "Type": "urn:ca:claim:scope",
      #     "Value": "orders"
      #   },
      #   {
      #     "$id": "3",
      #     "Type": "urn:ca:claim:scope",
      #     "Value": "inventory"
      #   },
      #   {
      #     "$id": "4",
      #     "Type": "urn:ca:claim:profile",
      #     "Value": "12345678"
      #   }
      #  ]
    end
  end
end
