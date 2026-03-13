# frozen_string_literal: true

require 'legion/extensions/pagerduty/helpers/client'

module Legion
  module Extensions
    module Pagerduty
      module Runners
        module Users
          include Legion::Extensions::Pagerduty::Helpers::Client

          def list_users(query: nil, per_page: 25, page: 0, **)
            params = { limit: per_page, offset: page * per_page }
            params[:query] = query if query
            response = connection(**).get('/users', params)
            { result: response.body }
          end

          def get_user(id:, **)
            response = connection(**).get("/users/#{id}")
            { result: response.body }
          end

          def create_user(name:, email:, role: 'user', description: nil, **)
            payload = { user: { type: 'user', name: name, email: email, role: role } }
            payload[:user][:description] = description if description
            response = connection(**).post('/users', payload)
            { result: response.body }
          end

          def update_user(id:, **opts)
            payload = opts.slice(:name, :email, :role, :description)
            response = connection(**opts).put("/users/#{id}", { user: { type: 'user', **payload } })
            { result: response.body }
          end

          def delete_user(id:, **)
            response = connection(**).delete("/users/#{id}")
            { result: response.status == 204 }
          end

          def list_contact_methods(user_id:, **)
            response = connection(**).get("/users/#{user_id}/contact_methods")
            { result: response.body }
          end

          def create_contact_method(user_id:, type:, label:, address:, country_code: nil, **)
            payload = { contact_method: { type: type, label: label, address: address } }
            payload[:contact_method][:country_code] = country_code.to_i if country_code
            response = connection(**).post("/users/#{user_id}/contact_methods", payload)
            { result: response.body }
          end

          def list_notification_rules(user_id:, **)
            response = connection(**).get("/users/#{user_id}/notification_rules")
            { result: response.body }
          end

          def create_notification_rule(user_id:, start_delay_in_minutes:, contact_method_id:, type: 'assignment_notification_rule', urgency: 'high', **)
            payload = {
              notification_rule: {
                type:                   type,
                start_delay_in_minutes: start_delay_in_minutes,
                contact_method:         { id: contact_method_id, type: 'contact_method_reference' },
                urgency:                urgency
              }
            }
            response = connection(**).post("/users/#{user_id}/notification_rules", payload)
            { result: response.body }
          end

          include Legion::Extensions::Helpers::Lex if Legion::Extensions.const_defined?(:Helpers) &&
                                                      Legion::Extensions::Helpers.const_defined?(:Lex)
        end
      end
    end
  end
end
