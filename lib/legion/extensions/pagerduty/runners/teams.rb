# frozen_string_literal: true

require 'legion/extensions/pagerduty/helpers/client'

module Legion
  module Extensions
    module Pagerduty
      module Runners
        module Teams
          include Legion::Extensions::Pagerduty::Helpers::Client

          def list_teams(query: nil, per_page: 25, page: 0, **)
            params = { limit: per_page, offset: page * per_page }
            params[:query] = query if query
            response = connection(**).get('/teams', params)
            { result: response.body }
          end

          def get_team(id:, **)
            response = connection(**).get("/teams/#{id}")
            { result: response.body }
          end

          def create_team(name:, description: nil, **)
            payload = { team: { type: 'team', name: name } }
            payload[:team][:description] = description if description
            response = connection(**).post('/teams', payload)
            { result: response.body }
          end

          def update_team(id:, **opts)
            payload = opts.slice(:name, :description)
            response = connection(**opts).put("/teams/#{id}", { team: { type: 'team', **payload } })
            { result: response.body }
          end

          def delete_team(id:, **)
            response = connection(**).delete("/teams/#{id}")
            { result: response.status == 204 }
          end

          def add_member(team_id:, user_id:, role: 'member', **)
            response = connection(**).put("/teams/#{team_id}/users/#{user_id}", { role: role })
            { result: response.status == 204 }
          end

          def remove_member(team_id:, user_id:, **)
            response = connection(**).delete("/teams/#{team_id}/users/#{user_id}")
            { result: response.status == 204 }
          end

          include Legion::Extensions::Helpers::Lex if Legion::Extensions.const_defined?(:Helpers) &&
                                                      Legion::Extensions::Helpers.const_defined?(:Lex)
        end
      end
    end
  end
end
