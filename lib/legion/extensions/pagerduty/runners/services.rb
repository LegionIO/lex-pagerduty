module Legion::Extensions::Pagerduty::Runners
  module Services
    include Legion::Extensions::Pagerduty::Helpers::Client
    include Legion::Extensions::Helpers::Lex

    # def create(**opts)
    #   # https://developer.pagerduty.com/api-reference/reference/REST/openapiv3.json/paths/~1services/post
    # end
    #
    # def create_integration(service_id:, **opts)
    #   # https://developer.pagerduty.com/api-reference/reference/REST/openapiv3.json/paths/~1services~1%7Bid%7D~1integrations/post
    # end
    #
    # def create_event_rule(service_id:, **opts)
    #   # https://developer.pagerduty.com/api-reference/reference/REST/openapiv3.json/paths/~1services~1%7Bid%7D~1rules/post
    # end
    #
    # def delete_event_rule(service_id:, rule_id:, **opts)
    #   # https://developer.pagerduty.com/api-reference/reference/REST/openapiv3.json/paths/~1services~1%7Bid%7D~1rules~1%7Brule_id%7D/delete
    # end
    #
    # def get_event_rule(service_id:, rule_id:, **opts)
    #   # placeholder
    # end
    #
    # def list_event_rules(service_id:, **opts)
    #   # https://developer.pagerduty.com/api-reference/reference/REST/openapiv3.json/paths/~1services~1%7Bid%7D~1rules/get
    # end
    #
    # def update_event_rule(service_id:, rule_id:, **opts)
    #   # https://developer.pagerduty.com/api-reference/reference/REST/openapiv3.json/paths/~1services~1%7Bid%7D~1rules~1%7Brule_id%7D/put
    # end
    #
    # def delete(service_id:, **opts)
    #   # placeholder
    # end
    #
    # def get(service_id:, **opts)
    #   # https://developer.pagerduty.com/api-reference/reference/REST/openapiv3.json/paths/~1services~1%7Bid%7D/get
    # end
    #
    # def list(**opts)
    #   # https://developer.pagerduty.com/api-reference/reference/REST/openapiv3.json/paths/~1services/get
    # end
    #
    # def update(service_id:, **opts)
    #   # https://developer.pagerduty.com/api-reference/reference/REST/openapiv3.json/paths/~1services~1%7Bid%7D/put
    # end
    #
    # def update_integration(service_id:, integration_id:, **opts)
    #   # https://developer.pagerduty.com/api-reference/reference/REST/openapiv3.json/paths/~1services~1%7Bid%7D~1integrations~1%7Bintegration_id%7D/put
    # end
    #
    # def get_integration(service_id:, integration_id:, **opts)
    #   # https://developer.pagerduty.com/api-reference/reference/REST/openapiv3.json/paths/~1services~1%7Bid%7D~1integrations~1%7Bintegration_id%7D/get
    # end
  end
end
