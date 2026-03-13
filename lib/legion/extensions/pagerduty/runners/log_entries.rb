# frozen_string_literal: true

require 'legion/extensions/pagerduty/helpers/client'

module Legion
  module Extensions
    module Pagerduty
      module Runners
        module LogEntries
          include Legion::Extensions::Pagerduty::Helpers::Client

          def list_log_entries(since_time: nil, until_time: nil, per_page: 25, page: 0, **)
            params = { limit: per_page, offset: page * per_page }
            params[:since] = since_time if since_time
            params[:until] = until_time if until_time
            response = connection(**).get('/log_entries', params)
            { result: response.body }
          end

          def get_log_entry(id:, **)
            response = connection(**).get("/log_entries/#{id}")
            { result: response.body }
          end

          include Legion::Extensions::Helpers::Lex if Legion::Extensions.const_defined?(:Helpers) &&
                                                      Legion::Extensions::Helpers.const_defined?(:Lex)
        end
      end
    end
  end
end
