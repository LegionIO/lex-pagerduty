module Legion::Extensions::Pagerduty::Runners
  module LogEntries
    include Legion::Extensions::Pagerduty::Helpers::Client
    include Legion::Extensions::Helpers::Lex

    # def get(id:, **opts)
    #   # https://developer.pagerduty.com/api-reference/reference/REST/openapiv3.json/paths/~1log_entries~1%7Bid%7D/get
    # end
    #
    # def list(**opts)
    #   # https://developer.pagerduty.com/api-reference/reference/REST/openapiv3.json/paths/~1log_entries/get
    # end
    #
    # def update_entry_channel(id:, **opts)
    #   # https://developer.pagerduty.com/api-reference/reference/REST/openapiv3.json/paths/~1log_entries~1%7Bid%7D~1channel/put
    # end
  end
end
