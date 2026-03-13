# frozen_string_literal: true

require 'legion/extensions/pagerduty/helpers/client'

module Legion
  module Extensions
    module Pagerduty
      module Runners
        module OnCalls
          include Legion::Extensions::Pagerduty::Helpers::Client

          def list_on_calls(schedule_ids: [], escalation_policy_ids: [], since_time: nil, until_time: nil,
                            per_page: 25, page: 0, **)
            params = { limit: per_page, offset: page * per_page }
            params['schedule_ids[]'] = schedule_ids unless schedule_ids.empty?
            params['escalation_policy_ids[]'] = escalation_policy_ids unless escalation_policy_ids.empty?
            params[:since] = since_time if since_time
            params[:until] = until_time if until_time
            response = connection(**).get('/oncalls', params)
            { result: response.body }
          end

          include Legion::Extensions::Helpers::Lex if Legion::Extensions.const_defined?(:Helpers) &&
                                                      Legion::Extensions::Helpers.const_defined?(:Lex)
        end
      end
    end
  end
end
