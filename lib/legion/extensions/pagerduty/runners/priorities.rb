# frozen_string_literal: true

module Legion
  module Extensions
    module Pagerduty
      module Runners
        module Priorities
          include Legion::Extensions::Pagerduty::Helpers::Client
          include Legion::Extensions::Helpers::Lex

          # def list(**opts)
          #   # https://developer.pagerduty.com/api-reference/reference/REST/openapiv3.json/paths/~1priorities/get
          # end
        end
      end
    end
  end
end
