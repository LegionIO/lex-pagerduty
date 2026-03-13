# frozen_string_literal: true

require 'legion/extensions/pagerduty/helpers/client'
require 'legion/extensions/pagerduty/runners/incidents'
require 'legion/extensions/pagerduty/runners/services'
require 'legion/extensions/pagerduty/runners/escalation_policies'
require 'legion/extensions/pagerduty/runners/schedules'
require 'legion/extensions/pagerduty/runners/users'
require 'legion/extensions/pagerduty/runners/teams'
require 'legion/extensions/pagerduty/runners/on_calls'
require 'legion/extensions/pagerduty/runners/priorities'
require 'legion/extensions/pagerduty/runners/maintenance_windows'
require 'legion/extensions/pagerduty/runners/log_entries'
require 'legion/extensions/pagerduty/runners/notifications'
require 'legion/extensions/pagerduty/runners/tags'
require 'legion/extensions/pagerduty/runners/abilities'
require 'legion/extensions/pagerduty/runners/vendors'

module Legion
  module Extensions
    module Pagerduty
      class Client
        include Helpers::Client
        include Runners::Incidents
        include Runners::Services
        include Runners::EscalationPolicies
        include Runners::Schedules
        include Runners::Users
        include Runners::Teams
        include Runners::OnCalls
        include Runners::Priorities
        include Runners::MaintenanceWindows
        include Runners::LogEntries
        include Runners::Notifications
        include Runners::Tags
        include Runners::Abilities
        include Runners::Vendors

        attr_reader :opts

        def initialize(token: nil, api_url: 'https://api.pagerduty.com', **extra)
          @opts = { token: token, api_url: api_url, **extra }
        end

        def connection(**override)
          super(**@opts.merge(override))
        end
      end
    end
  end
end
