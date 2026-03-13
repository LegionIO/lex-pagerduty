# lex-pagerduty: PagerDuty Integration for LegionIO

**Repository Level 3 Documentation**
- **Category**: `/Users/miverso2/rubymine/legion/extensions/CLAUDE.md`

## Purpose

Legion Extension that connects LegionIO to PagerDuty. Provides runners for managing incidents, schedules, escalation policies, on-calls, notifications, log entries, maintenance windows, priorities, and subscriptions.

**License**: MIT (assumed)

## Architecture

```
Legion::Extensions::Pagerduty
└── Runners/
    ├── Incident           # Incident management
    ├── Schedules          # Schedule queries
    ├── EscalationPolicies # Escalation policy management
    ├── OnCalls            # On-call schedule queries
    ├── Notifications      # Notification management
    ├── LogEntries         # Log entry queries
    ├── MaintenanceWindows # Maintenance window management
    ├── Priorities         # Priority management
    └── Subscriptions      # Subscription management
```

## Dependencies

| Gem | Purpose |
|-----|---------|
| `pagerduty` | PagerDuty Ruby client |

## Testing

```bash
bundle install
bundle exec rspec
bundle exec rubocop
```

---

**Maintained By**: Matthew Iverson (@Esity)
