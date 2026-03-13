# frozen_string_literal: true

require 'legion/extensions/pagerduty/helpers/client'

module Legion
  module Extensions
    module Pagerduty
      module Runners
        module Services
          include Legion::Extensions::Pagerduty::Helpers::Client

          def list_services(per_page: 25, page: 0, query: nil, **)
            params = { limit: per_page, offset: page * per_page }
            params[:query] = query if query
            response = connection(**).get('/services', params)
            { result: response.body }
          end

          def get_service(id:, **)
            response = connection(**).get("/services/#{id}")
            { result: response.body }
          end

          def create_service(name:, escalation_policy_id:, description: nil, auto_resolve_timeout: nil,
                             acknowledgement_timeout: nil, **)
            payload = {
              service: {
                type:              'service',
                name:              name,
                escalation_policy: { id: escalation_policy_id, type: 'escalation_policy_reference' }
              }
            }
            payload[:service][:description] = description if description
            payload[:service][:auto_resolve_timeout] = auto_resolve_timeout if auto_resolve_timeout
            payload[:service][:acknowledgement_timeout] = acknowledgement_timeout if acknowledgement_timeout
            response = connection(**).post('/services', payload)
            { result: response.body }
          end

          def update_service(id:, **opts)
            payload = opts.slice(:name, :description, :auto_resolve_timeout, :acknowledgement_timeout, :status)
            response = connection(**opts).put("/services/#{id}", { service: { type: 'service', **payload } })
            { result: response.body }
          end

          def delete_service(id:, **)
            response = connection(**).delete("/services/#{id}")
            { result: response.status == 204 }
          end

          def list_integrations(service_id:, **)
            response = connection(**).get("/services/#{service_id}/integrations")
            { result: response.body }
          end

          def create_integration(service_id:, type: 'generic_events_api_inbound_integration', name: nil, vendor_id: nil, **)
            payload = { integration: { type: type } }
            payload[:integration][:name] = name if name
            payload[:integration][:vendor] = { id: vendor_id, type: 'vendor_reference' } if vendor_id
            response = connection(**).post("/services/#{service_id}/integrations", payload)
            { result: response.body }
          end

          def get_integration(service_id:, integration_id:, **)
            response = connection(**).get("/services/#{service_id}/integrations/#{integration_id}")
            { result: response.body }
          end

          def update_integration(service_id:, integration_id:, **opts)
            payload = opts.slice(:name, :type)
            response = connection(**opts).put("/services/#{service_id}/integrations/#{integration_id}",
                                              { integration: { type: 'generic_events_api_inbound_integration', **payload } })
            { result: response.body }
          end

          include Legion::Extensions::Helpers::Lex if Legion::Extensions.const_defined?(:Helpers) &&
                                                      Legion::Extensions::Helpers.const_defined?(:Lex)
        end
      end
    end
  end
end
