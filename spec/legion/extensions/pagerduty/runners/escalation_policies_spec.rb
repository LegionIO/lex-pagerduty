# frozen_string_literal: true

RSpec.describe Legion::Extensions::Pagerduty::Runners::EscalationPolicies do
  let(:client) { Legion::Extensions::Pagerduty::Client.new(token: 'test-token') }
  let(:conn) { instance_double(Faraday::Connection) }

  before { allow(client).to receive(:connection).and_return(conn) }

  describe '#list_escalation_policies' do
    it 'fetches escalation policies' do
      response = instance_double(Faraday::Response, body: { 'escalation_policies' => [] })
      allow(conn).to receive(:get).with('/escalation_policies', { limit: 25, offset: 0 }).and_return(response)
      result = client.list_escalation_policies
      expect(result[:result]['escalation_policies']).to eq([])
    end
  end

  describe '#get_escalation_policy' do
    it 'fetches a single policy' do
      response = instance_double(Faraday::Response, body: { 'escalation_policy' => { 'id' => 'EP1' } })
      allow(conn).to receive(:get).with('/escalation_policies/EP1').and_return(response)
      result = client.get_escalation_policy(id: 'EP1')
      expect(result[:result]['escalation_policy']['id']).to eq('EP1')
    end
  end

  describe '#create_escalation_policy' do
    it 'creates a policy' do
      rules = [{ escalation_delay_in_minutes: 30, targets: [{ id: 'U1', type: 'user_reference' }] }]
      response = instance_double(Faraday::Response, body: { 'escalation_policy' => { 'id' => 'EP2' } })
      allow(conn).to receive(:post).with('/escalation_policies', hash_including(:escalation_policy)).and_return(response)
      result = client.create_escalation_policy(name: 'Test EP', escalation_rules: rules)
      expect(result[:result]['escalation_policy']['id']).to eq('EP2')
    end
  end

  describe '#delete_escalation_policy' do
    it 'deletes a policy' do
      response = instance_double(Faraday::Response, status: 204)
      allow(conn).to receive(:delete).with('/escalation_policies/EP1').and_return(response)
      result = client.delete_escalation_policy(id: 'EP1')
      expect(result[:result]).to be true
    end
  end
end
