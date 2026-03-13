# frozen_string_literal: true

require 'legion/extensions/pagerduty/helpers/client'

module Legion
  module Extensions
    module Pagerduty
      module Runners
        module Vendors
          include Legion::Extensions::Pagerduty::Helpers::Client

          def list_vendors(per_page: 25, page: 0, **)
            params = { limit: per_page, offset: page * per_page }
            response = connection(**).get('/vendors', params)
            { result: response.body }
          end

          def get_vendor(id:, **)
            response = connection(**).get("/vendors/#{id}")
            { result: response.body }
          end

          include Legion::Extensions::Helpers::Lex if Legion::Extensions.const_defined?(:Helpers) &&
                                                      Legion::Extensions::Helpers.const_defined?(:Lex)
        end
      end
    end
  end
end
