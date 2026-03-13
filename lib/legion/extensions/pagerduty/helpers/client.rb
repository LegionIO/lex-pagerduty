# frozen_string_literal: true

require 'faraday'

module Legion
  module Extensions
    module Pagerduty
      module Helpers
        module Client
          def connection(api_url: 'https://api.pagerduty.com', token: nil, **_opts)
            Faraday.new(url: api_url) do |conn|
              conn.request :json
              conn.response :json, content_type: /\bjson$/
              conn.headers['Content-Type'] = 'application/json'
              conn.headers['Authorization'] = "Token token=#{token}" if token
            end
          end
        end
      end
    end
  end
end
