# frozen_string_literal: true

require 'legion/extensions/pagerduty/helpers/client'

module Legion
  module Extensions
    module Pagerduty
      module Runners
        module Schedules
          include Legion::Extensions::Pagerduty::Helpers::Client

          def list_schedules(query: nil, per_page: 25, page: 0, **)
            params = { limit: per_page, offset: page * per_page }
            params[:query] = query if query
            response = connection(**).get('/schedules', params)
            { result: response.body }
          end

          def get_schedule(id:, since_time: nil, until_time: nil, **)
            params = {}
            params[:since] = since_time if since_time
            params[:until] = until_time if until_time
            response = connection(**).get("/schedules/#{id}", params)
            { result: response.body }
          end

          def create_schedule(schedule:, **)
            response = connection(**).post('/schedules', { schedule: schedule })
            { result: response.body }
          end

          def update_schedule(id:, schedule:, **)
            response = connection(**).put("/schedules/#{id}", { schedule: schedule })
            { result: response.body }
          end

          def delete_schedule(id:, **)
            response = connection(**).delete("/schedules/#{id}")
            { result: response.status == 204 }
          end

          def list_schedule_overrides(id:, since_time:, until_time:, **)
            response = connection(**).get("/schedules/#{id}/overrides", since: since_time, until: until_time)
            { result: response.body }
          end

          def create_schedule_override(id:, overrides:, **)
            response = connection(**).post("/schedules/#{id}/overrides", { overrides: overrides })
            { result: response.body }
          end

          def delete_schedule_override(schedule_id:, override_id:, **)
            response = connection(**).delete("/schedules/#{schedule_id}/overrides/#{override_id}")
            { result: response.status == 204 }
          end

          def list_on_call_users(id:, since_time: nil, until_time: nil, **)
            params = {}
            params[:since] = since_time if since_time
            params[:until] = until_time if until_time
            response = connection(**).get("/schedules/#{id}/users", params)
            { result: response.body }
          end

          include Legion::Extensions::Helpers::Lex if Legion::Extensions.const_defined?(:Helpers) &&
                                                      Legion::Extensions::Helpers.const_defined?(:Lex)
        end
      end
    end
  end
end
