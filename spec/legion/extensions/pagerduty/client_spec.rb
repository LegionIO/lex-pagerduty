# frozen_string_literal: true

RSpec.describe Legion::Extensions::Pagerduty::Client do
  subject(:client) { described_class.new(token: 'test-token') }

  it 'stores opts' do
    expect(client.opts[:token]).to eq('test-token')
    expect(client.opts[:api_url]).to eq('https://api.pagerduty.com')
  end

  it 'includes all runner modules' do
    expect(client).to respond_to(:list_incidents)
    expect(client).to respond_to(:list_services)
    expect(client).to respond_to(:list_escalation_policies)
    expect(client).to respond_to(:list_schedules)
    expect(client).to respond_to(:list_users)
    expect(client).to respond_to(:list_teams)
    expect(client).to respond_to(:list_on_calls)
    expect(client).to respond_to(:list_priorities)
    expect(client).to respond_to(:list_maintenance_windows)
    expect(client).to respond_to(:list_log_entries)
    expect(client).to respond_to(:list_notifications)
    expect(client).to respond_to(:list_tags)
    expect(client).to respond_to(:list_abilities)
    expect(client).to respond_to(:list_vendors)
  end
end
