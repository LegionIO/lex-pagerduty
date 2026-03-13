# lex-pagerduty

PagerDuty integration for [LegionIO](https://github.com/LegionIO/LegionIO). Manage incidents, services, escalation policies, schedules, users, teams, on-calls, priorities, maintenance windows, log entries, notifications, tags, abilities, and vendors via the PagerDuty REST API v2.

## Installation

```bash
gem install lex-pagerduty
```

Or add to your Gemfile:

```ruby
gem 'lex-pagerduty'
```

## Standalone Usage

```ruby
require 'legion/extensions/pagerduty'

client = Legion::Extensions::Pagerduty::Client.new(token: 'your-api-token')

# Incidents
client.list_incidents(statuses: ['triggered', 'acknowledged'])
client.create_incident(title: 'Server down', service_id: 'PSVC123')
client.update_incident(id: 'PINC456', from: 'user@example.com', status: 'acknowledged')
client.snooze_incident(id: 'PINC456', from: 'user@example.com', duration: 3600)

# Services
client.list_services
client.create_service(name: 'My App', escalation_policy_id: 'PEP789')

# Schedules
client.list_schedules
client.list_on_call_users(id: 'PSCH123')

# Users & Teams
client.list_users(query: 'john')
client.add_member(team_id: 'PTEAM1', user_id: 'PUSER1')
```

## Runners

| Runner | Operations |
|--------|-----------|
| Incidents | List, create, get, update, merge, snooze, notes, alerts |
| Services | List, create, get, update, delete, integrations |
| EscalationPolicies | List, create, get, update, delete |
| Schedules | List, create, get, update, delete, overrides, on-call users |
| Users | List, create, get, update, delete, contact methods, notification rules |
| Teams | List, create, get, update, delete, add/remove members |
| OnCalls | List on-call entries |
| Priorities | List priorities |
| MaintenanceWindows | List, create, get, update, delete |
| LogEntries | List, get |
| Notifications | List |
| Tags | List, create, get, delete, assign/remove from entities |
| Abilities | List, test |
| Vendors | List, get |

## Requirements

- Ruby >= 3.4
- [LegionIO](https://github.com/LegionIO/LegionIO) framework
- PagerDuty account with API token

## License

MIT
