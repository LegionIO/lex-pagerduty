module Legion::Extensions::Pagerduty::Runners
  module Schedules
    include Legion::Extensions::Pagerduty::Helpers::Client
    include Legion::Extensions::Helpers::Lex

    def create(**opts)
      # https://developer.pagerduty.com/api-reference/reference/REST/openapiv3.json/paths/~1schedules/post
    end

    def create_override(**opts)
      # https://developer.pagerduty.com/api-reference/reference/REST/openapiv3.json/paths/~1schedules~1%7Bid%7D~1overrides/post
    end

    def delete(**opts)
      # https://developer.pagerduty.com/api-reference/reference/REST/openapiv3.json/paths/~1schedules~1%7Bid%7D/delete
    end

    def get(**opts)
      # https://developer.pagerduty.com/api-reference/reference/REST/openapiv3.json/paths/~1schedules~1%7Bid%7D/get
    end

    def list_overrides(**opts)
      # https://developer.pagerduty.com/api-reference/reference/REST/openapiv3.json/paths/~1schedules~1%7Bid%7D~1overrides/get
    end

    def list_users_on_call(**opts)
      # https://developer.pagerduty.com/api-reference/reference/REST/openapiv3.json/paths/~1schedules~1%7Bid%7D~1users/get
    end

    def preview_schedule(**opts)
      # https://developer.pagerduty.com/api-reference/reference/REST/openapiv3.json/paths/~1schedules~1preview/post
    end

    def update_schedule(**opts)
      # https://developer.pagerduty.com/api-reference/reference/REST/openapiv3.json/paths/~1schedules~1%7Bid%7D/put
    end
  end
end
