# frozen_string_literal: true

require 'legion/extensions/pagerduty/helpers/client'

module Legion
  module Extensions
    module Pagerduty
      module Runners
        module Priorities
          include Legion::Extensions::Pagerduty::Helpers::Client

          def list_priorities(per_page: 25, page: 0, **)
            params = { limit: per_page, offset: page * per_page }
            response = connection(**).get('/priorities', params)
            { result: response.body }
          end

          include Legion::Extensions::Helpers::Lex if Legion::Extensions.const_defined?(:Helpers) &&
                                                      Legion::Extensions::Helpers.const_defined?(:Lex)
        end
      end
    end
  end
end
