# frozen_string_literal: true

module Legion
  module Extensions
    module Pagerduty
      module Runners
        module Incident
          include Legion::Extensions::Pagerduty::Helpers::Client
          include Legion::Extensions::Helpers::Lex

          # rubycop:disable Metrics/ParameterList,Layout/LineLength
          def trigger(summary:, source:, key: find_setting('key'), severity: 'critical', timestamp: Time.now, component: nil, group: nil, pd_class: nil, client: nil,
                      custom_details: nil, images: nil, links: nil, client_url: nil, **)
            pagerduty = Pagerduty.build(integration_key: key, api_version: 2)
            trigger = { summary: summary, source: source, severity: severity, timestamp: timestamp }
            trigger[:component] = component unless component.nil?
            trigger[:group] = group unless group.nil?
            trigger[:class] = pd_class unless pd_class.nil?
            trigger[:client] = client unless client.nil?
            trigger[:custom_details] = custom_details unless custom_details.nil?
            trigger[:images] = images unless images.nil?
            trigger[:links] = links unless links.nil?
            trigger[:client_url] = client_url unless client_url.nil?

            { status: pagerduty.trigger(**trigger), **trigger }
          end

          def acknowledge(incident:, key: find_setting('key'), description: nil, details: nil, **_opts)
            pagerduty = Pagerduty.build(integration_key: key, api_version: 2)
            incident = pagerduty.incident(incident)
            { incident: incident, status: incident.acknowledge(description, details) }
          end

          def resolve(incident:, key: find_setting('key'), description: nil, details: nil, **_opts)
            pagerduty = Pagerduty.build(integration_key: key, api_version: 2)
            { incident: incident, status: pagerduty.incident(incident).resolve(description, details) }
          end

          def get(incident:, key: find_setting('key'), **_opts)
            pagerduty = Pagerduty.build(integration_key: key, api_version: 2)
            results = pagerduty.incident(incident)

            { incident: incident, **results }
          end

          # def list(key: find_setting('key'), **opts)
          #   # https://developer.pagerduty.com/api-reference/reference/REST/openapiv3.json/paths/~1incidents/get
          # end
          #
          # def merge(key: find_setting('key'), **opts)
          #   # https://developer.pagerduty.com/api-reference/reference/REST/openapiv3.json/paths/~1incidents~1%7Bid%7D~1merge/put
          # end
          #
          # def snooze(key: find_setting('key'), **opts)
          #   # https://developer.pagerduty.com/api-reference/reference/REST/openapiv3.json/paths/~1incidents~1%7Bid%7D~1snooze/post
          # end
          #
          # def create_note(incident:, key: find_setting('key'), **opts)
          #   # https://developer.pagerduty.com/api-reference/reference/REST/openapiv3.json/paths/~1incidents~1%7Bid%7D~1notes/post
          # end
        end
      end
    end
  end
end
