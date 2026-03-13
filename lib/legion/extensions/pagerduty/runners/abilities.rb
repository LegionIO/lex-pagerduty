# frozen_string_literal: true

require 'legion/extensions/pagerduty/helpers/client'

module Legion
  module Extensions
    module Pagerduty
      module Runners
        module Abilities
          include Legion::Extensions::Pagerduty::Helpers::Client

          def list_abilities(**)
            response = connection(**).get('/abilities')
            { result: response.body }
          end

          def test_ability(ability:, **)
            response = connection(**).get("/abilities/#{ability}")
            { result: response.status == 204 }
          end

          include Legion::Extensions::Helpers::Lex if Legion::Extensions.const_defined?(:Helpers) &&
                                                      Legion::Extensions::Helpers.const_defined?(:Lex)
        end
      end
    end
  end
end
