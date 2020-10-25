module Legion::Extensions::Pagerduty::Runners
  module Subscriptions
    include Legion::Extensions::Pagerduty::Helpers::Client
    include Legion::Extensions::Helpers::Lex

    # def create(**opts)
    #   # {id: 'string', type: 'string',
    #   # delivery_method: {id: 'string', type: 'string', url: 'string'},
    #   # description: 'string',
    #   # events: 'array',
    #   # filter: 'object'
    #   # }
    # end
    #
    # def delete(id:, **opts)
    #   # https://developer.pagerduty.com/api-reference/reference/REST/openapiv3.json/paths/~1subscriptions~1%7Bid%7D/delete
    # end
    #
    # def get(id:, **opts)
    #   # https://developer.pagerduty.com/api-reference/reference/REST/openapiv3.json/paths/~1subscriptions~1%7Bid%7D/get
    # end
    #
    # def list(limit: nil, offset: nil, total: false, **opts)
    #   # https://developer.pagerduty.com/api-reference/reference/REST/openapiv3.json/paths/~1subscriptions/get
    # end
    #
    # def test(id:, **opts)
    #   # https://developer.pagerduty.com/api-reference/reference/REST/openapiv3.json/paths/~1subscriptions~1%7Bid%7D~1ping/post
    # end
    #
    # def update(id:, **opts)
    #   # https://developer.pagerduty.com/api-reference/reference/REST/openapiv3.json/paths/~1subscriptions~1%7Bid%7D/put
    # end
  end
end
