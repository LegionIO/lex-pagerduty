# frozen_string_literal: true

require 'legion/extensions/pagerduty/helpers/client'

module Legion
  module Extensions
    module Pagerduty
      module Runners
        module Tags
          include Legion::Extensions::Pagerduty::Helpers::Client

          def list_tags(query: nil, per_page: 25, page: 0, **)
            params = { limit: per_page, offset: page * per_page }
            params[:query] = query if query
            response = connection(**).get('/tags', params)
            { result: response.body }
          end

          def get_tag(id:, **)
            response = connection(**).get("/tags/#{id}")
            { result: response.body }
          end

          def create_tag(label:, **)
            response = connection(**).post('/tags', { tag: { type: 'tag', label: label } })
            { result: response.body }
          end

          def delete_tag(id:, **)
            response = connection(**).delete("/tags/#{id}")
            { result: response.status == 204 }
          end

          def list_entity_tags(entity_type:, entity_id:, **)
            response = connection(**).get("/#{entity_type}/#{entity_id}/tags")
            { result: response.body }
          end

          def assign_tags(entity_type:, entity_id:, tags:, **)
            add = tags.map { |t| t.is_a?(Hash) ? t : { type: 'tag_reference', id: t } }
            response = connection(**).post("/#{entity_type}/#{entity_id}/change_tags", { add: add, remove: [] })
            { result: response.status == 200 }
          end

          def remove_tags(entity_type:, entity_id:, tags:, **)
            remove = tags.map { |t| t.is_a?(Hash) ? t : { type: 'tag_reference', id: t } }
            response = connection(**).post("/#{entity_type}/#{entity_id}/change_tags", { add: [], remove: remove })
            { result: response.status == 200 }
          end

          include Legion::Extensions::Helpers::Lex if Legion::Extensions.const_defined?(:Helpers) &&
                                                      Legion::Extensions::Helpers.const_defined?(:Lex)
        end
      end
    end
  end
end
