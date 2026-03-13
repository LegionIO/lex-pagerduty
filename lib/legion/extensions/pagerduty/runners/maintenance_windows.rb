# frozen_string_literal: true

require 'legion/extensions/pagerduty/helpers/client'

module Legion
  module Extensions
    module Pagerduty
      module Runners
        module MaintenanceWindows
          include Legion::Extensions::Pagerduty::Helpers::Client

          def list_maintenance_windows(service_ids: [], query: nil, per_page: 25, page: 0, **)
            params = { limit: per_page, offset: page * per_page }
            params['service_ids[]'] = service_ids unless service_ids.empty?
            params[:query] = query if query
            response = connection(**).get('/maintenance_windows', params)
            { result: response.body }
          end

          def get_maintenance_window(id:, **)
            response = connection(**).get("/maintenance_windows/#{id}")
            { result: response.body }
          end

          def create_maintenance_window(start_time:, end_time:, service_ids:, description: nil, **)
            services = service_ids.map { |sid| { id: sid, type: 'service_reference' } }
            payload = {
              maintenance_window: {
                type:       'maintenance_window',
                start_time: start_time,
                end_time:   end_time,
                services:   services
              }
            }
            payload[:maintenance_window][:description] = description if description
            response = connection(**).post('/maintenance_windows', payload)
            { result: response.body }
          end

          def update_maintenance_window(id:, **opts)
            payload = opts.slice(:start_time, :end_time, :description)
            payload[:services] = opts[:service_ids].map { |sid| { id: sid, type: 'service_reference' } } if opts[:service_ids]
            response = connection(**opts).put("/maintenance_windows/#{id}",
                                              { maintenance_window: { type: 'maintenance_window', **payload } })
            { result: response.body }
          end

          def delete_maintenance_window(id:, **)
            response = connection(**).delete("/maintenance_windows/#{id}")
            { result: response.status == 204 }
          end

          include Legion::Extensions::Helpers::Lex if Legion::Extensions.const_defined?(:Helpers) &&
                                                      Legion::Extensions::Helpers.const_defined?(:Lex)
        end
      end
    end
  end
end
