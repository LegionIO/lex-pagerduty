# frozen_string_literal: true

RSpec.describe Legion::Extensions::Pagerduty::Runners::Services do
  let(:client) { Legion::Extensions::Pagerduty::Client.new(token: 'test-token') }
  let(:conn) { instance_double(Faraday::Connection) }

  before { allow(client).to receive(:connection).and_return(conn) }

  describe '#list_services' do
    it 'fetches services' do
      response = instance_double(Faraday::Response, body: { 'services' => [] })
      allow(conn).to receive(:get).with('/services', { limit: 25, offset: 0 }).and_return(response)
      result = client.list_services
      expect(result[:result]['services']).to eq([])
    end
  end

  describe '#get_service' do
    it 'fetches a single service' do
      response = instance_double(Faraday::Response, body: { 'service' => { 'id' => 'SVC1' } })
      allow(conn).to receive(:get).with('/services/SVC1').and_return(response)
      result = client.get_service(id: 'SVC1')
      expect(result[:result]['service']['id']).to eq('SVC1')
    end
  end

  describe '#create_service' do
    it 'creates a service' do
      response = instance_double(Faraday::Response, body: { 'service' => { 'id' => 'SVC2' } })
      allow(conn).to receive(:post).with('/services', hash_including(:service)).and_return(response)
      result = client.create_service(name: 'My Service', escalation_policy_id: 'EP1')
      expect(result[:result]['service']['id']).to eq('SVC2')
    end
  end

  describe '#delete_service' do
    it 'deletes a service' do
      response = instance_double(Faraday::Response, status: 204)
      allow(conn).to receive(:delete).with('/services/SVC1').and_return(response)
      result = client.delete_service(id: 'SVC1')
      expect(result[:result]).to be true
    end
  end

  describe '#create_integration' do
    it 'creates an integration' do
      response = instance_double(Faraday::Response, body: { 'integration' => { 'id' => 'INT1' } })
      allow(conn).to receive(:post).with('/services/SVC1/integrations', hash_including(:integration)).and_return(response)
      result = client.create_integration(service_id: 'SVC1')
      expect(result[:result]['integration']['id']).to eq('INT1')
    end
  end
end
