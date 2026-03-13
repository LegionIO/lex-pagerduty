# frozen_string_literal: true

require 'legion/extensions/pagerduty/helpers/client'

module Legion
  module Extensions
    module Pagerduty
      module Runners
        module Incidents
          include Legion::Extensions::Pagerduty::Helpers::Client

          def list_incidents(statuses: [], service_ids: [], urgencies: [], per_page: 25, page: 0, **)
            params = { limit: per_page, offset: page * per_page }
            params['statuses[]'] = statuses unless statuses.empty?
            params['service_ids[]'] = service_ids unless service_ids.empty?
            params['urgencies[]'] = urgencies unless urgencies.empty?
            response = connection(**).get('/incidents', params)
            { result: response.body }
          end

          def get_incident(id:, **)
            response = connection(**).get("/incidents/#{id}")
            { result: response.body }
          end

          def create_incident(title:, service_id:, type: 'incident', urgency: nil, body: nil, escalation_policy_id: nil, **)
            payload = { incident: { type: type, title: title, service: { id: service_id, type: 'service_reference' } } }
            payload[:incident][:urgency] = urgency if urgency
            payload[:incident][:body] = { type: 'incident_body', details: body } if body
            payload[:incident][:escalation_policy] = { id: escalation_policy_id, type: 'escalation_policy_reference' } if escalation_policy_id
            response = connection(**).post('/incidents', payload)
            { result: response.body }
          end

          def update_incident(id:, from:, status: nil, title: nil, urgency: nil, escalation_policy_id: nil, **)
            payload = { incident: { type: 'incident_reference' } }
            payload[:incident][:status] = status if status
            payload[:incident][:title] = title if title
            payload[:incident][:urgency] = urgency if urgency
            payload[:incident][:escalation_policy] = { id: escalation_policy_id, type: 'escalation_policy_reference' } if escalation_policy_id
            conn = connection(**)
            conn.headers['From'] = from
            response = conn.put("/incidents/#{id}", payload)
            { result: response.body }
          end

          def merge_incidents(id:, from:, source_incident_ids:, **)
            source = source_incident_ids.map { |sid| { id: sid, type: 'incident_reference' } }
            conn = connection(**)
            conn.headers['From'] = from
            response = conn.put("/incidents/#{id}/merge", { source_incidents: source })
            { result: response.body }
          end

          def snooze_incident(id:, from:, duration:, **)
            conn = connection(**)
            conn.headers['From'] = from
            response = conn.post("/incidents/#{id}/snooze", { duration: duration })
            { result: response.body }
          end

          def list_incident_notes(id:, **)
            response = connection(**).get("/incidents/#{id}/notes")
            { result: response.body }
          end

          def create_incident_note(id:, from:, content:, **)
            conn = connection(**)
            conn.headers['From'] = from
            response = conn.post("/incidents/#{id}/notes", { note: { content: content } })
            { result: response.body }
          end

          def list_incident_alerts(id:, per_page: 25, page: 0, **)
            params = { limit: per_page, offset: page * per_page }
            response = connection(**).get("/incidents/#{id}/alerts", params)
            { result: response.body }
          end

          def get_incident_alert(incident_id:, alert_id:, **)
            response = connection(**).get("/incidents/#{incident_id}/alerts/#{alert_id}")
            { result: response.body }
          end

          def update_incident_alert(incident_id:, alert_id:, from:, status:, **)
            conn = connection(**)
            conn.headers['From'] = from
            response = conn.put("/incidents/#{incident_id}/alerts/#{alert_id}", { alert: { type: 'alert', status: status } })
            { result: response.body }
          end

          include Legion::Extensions::Helpers::Lex if Legion::Extensions.const_defined?(:Helpers) &&
                                                      Legion::Extensions::Helpers.const_defined?(:Lex)
        end
      end
    end
  end
end
