# frozen_string_literal: true

module Legion
  module Extensions
    module Pagerduty
      module Helpers
        module Client
          def token(**opts)
            find_setting('token', opts)
          end

          def conn(**opts)
            # faraday persistant conn
          end
        end
      end
    end
  end
end
