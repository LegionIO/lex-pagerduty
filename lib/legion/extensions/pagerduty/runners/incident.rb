module Legion::Extensions::Pagerduty::Runners
  module Incident
    include Legion::Extensions::Pagerduty::Helpers::Client
    include Legion::Extensions::Helpers::Lex

    def trigger(summary:, source:, severity: 'critical', timestamp: Time.now, component: nil, group: nil, class: nil, client: nil, **opts)
      # https://developer.pagerduty.com/api-reference/reference/REST/openapiv3.json/paths/~1incidents/post
    end

    def acknowledge(incident:, **opts)
      # https://developer.pagerduty.com/api-reference/reference/REST/openapiv3.json/paths/~1incidents~1%7Bid%7D/put
    end

    def resolve(incident:, **opts)
      # https://developer.pagerduty.com/api-reference/reference/REST/openapiv3.json/paths/~1incidents~1%7Bid%7D/put
    end

    def get(incident:, **opts)
      # https://developer.pagerduty.com/api-reference/reference/REST/openapiv3.json/paths/~1incidents~1%7Bid%7D/get
    end

    def list(**opts)
      # https://developer.pagerduty.com/api-reference/reference/REST/openapiv3.json/paths/~1incidents/get
    end

    def merge(**opts)
      # https://developer.pagerduty.com/api-reference/reference/REST/openapiv3.json/paths/~1incidents~1%7Bid%7D~1merge/put
    end

    def snooze(**opts)
      # https://developer.pagerduty.com/api-reference/reference/REST/openapiv3.json/paths/~1incidents~1%7Bid%7D~1snooze/post
    end

    def create_note(incident:, **opts)
      # https://developer.pagerduty.com/api-reference/reference/REST/openapiv3.json/paths/~1incidents~1%7Bid%7D~1notes/post
    end
  end
end
