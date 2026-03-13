# frozen_string_literal: true

require 'legion/extensions/pagerduty/helpers/client'

module Legion
  module Extensions
    module Pagerduty
      module Runners
        module EscalationPolicies
          include Legion::Extensions::Pagerduty::Helpers::Client

          def list_escalation_policies(query: nil, per_page: 25, page: 0, **)
            params = { limit: per_page, offset: page * per_page }
            params[:query] = query if query
            response = connection(**).get('/escalation_policies', params)
            { result: response.body }
          end

          def get_escalation_policy(id:, **)
            response = connection(**).get("/escalation_policies/#{id}")
            { result: response.body }
          end

          def create_escalation_policy(name:, escalation_rules:, description: nil, repeat_enabled: false,
                                       num_loops: 0, **)
            payload = {
              escalation_policy: {
                type:             'escalation_policy',
                name:             name,
                escalation_rules: escalation_rules,
                repeat_enabled:   repeat_enabled,
                num_loops:        num_loops
              }
            }
            payload[:escalation_policy][:description] = description if description
            response = connection(**).post('/escalation_policies', payload)
            { result: response.body }
          end

          def update_escalation_policy(id:, **opts)
            payload = opts.slice(:name, :description, :escalation_rules, :repeat_enabled, :num_loops)
            response = connection(**opts).put("/escalation_policies/#{id}",
                                              { escalation_policy: { type: 'escalation_policy', **payload } })
            { result: response.body }
          end

          def delete_escalation_policy(id:, **)
            response = connection(**).delete("/escalation_policies/#{id}")
            { result: response.status == 204 }
          end

          include Legion::Extensions::Helpers::Lex if Legion::Extensions.const_defined?(:Helpers) &&
                                                      Legion::Extensions::Helpers.const_defined?(:Lex)
        end
      end
    end
  end
end
