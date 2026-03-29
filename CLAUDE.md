# lex-pagerduty: PagerDuty Integration for LegionIO

**Repository Level 3 Documentation**
- **Parent**: `/Users/miverso2/rubymine/legion/extensions-other/CLAUDE.md`
- **Grandparent**: `/Users/miverso2/rubymine/legion/CLAUDE.md`

## Purpose

Legion Extension that connects LegionIO to PagerDuty via the REST API v2. Provides runners for managing incidents, services, escalation policies, schedules, users, teams, on-calls, priorities, maintenance windows, log entries, notifications, tags, abilities, and vendors.

**GitHub**: https://github.com/LegionIO/lex-pagerduty
**License**: MIT
**Version**: 0.2.1

## Architecture

```
Legion::Extensions::Pagerduty
├── Runners/
│   ├── Incidents            # Incident lifecycle (create, ack, resolve, merge, snooze, notes, alerts)
│   ├── Services             # Service CRUD + integrations
│   ├── EscalationPolicies   # Escalation policy CRUD
│   ├── Schedules            # Schedule CRUD + overrides + on-call users
│   ├── Users                # User CRUD + contact methods + notification rules
│   ├── Teams                # Team CRUD + member management
│   ├── OnCalls              # On-call listing with schedule/policy filters
│   ├── Priorities           # Priority listing
│   ├── MaintenanceWindows   # Maintenance window CRUD
│   ├── LogEntries           # Log entry queries
│   ├── Notifications        # Notification listing
│   ├── Tags                 # Tag CRUD + entity assignment
│   ├── Abilities            # Account ability queries
│   └── Vendors              # Vendor listing
├── Helpers/
│   └── Client               # Faraday connection builder (PagerDuty REST API v2)
└── Client                   # Standalone client class (includes all runners)
```

## Key Files

| Path | Purpose |
|------|---------|
| `lib/legion/extensions/pagerduty.rb` | Entry point, loads all runners |
| `lib/legion/extensions/pagerduty/client.rb` | Standalone client (initialize with token:) |
| `lib/legion/extensions/pagerduty/helpers/client.rb` | Faraday builder for PagerDuty API |
| `lib/legion/extensions/pagerduty/runners/` | All runners |

## API Authentication

PagerDuty uses token-based auth: `Authorization: Token token=YOUR_TOKEN`

Mutating incident operations require a `From` header with the user's email address.

## Dependencies

| Gem | Purpose |
|-----|---------|
| `faraday` (>= 2.0) | HTTP client for PagerDuty REST API v2 |

## Development

37 specs total.

```bash
bundle install
bundle exec rspec
bundle exec rubocop
```

---

**Maintained By**: Matthew Iverson (@Esity)
