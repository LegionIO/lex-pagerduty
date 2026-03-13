# frozen_string_literal: true

RSpec.describe Legion::Extensions::Pagerduty::Runners::Incidents do
  let(:client) { Legion::Extensions::Pagerduty::Client.new(token: 'test-token') }
  let(:conn) { instance_double(Faraday::Connection) }

  before { allow(client).to receive(:connection).and_return(conn) }

  describe '#list_incidents' do
    it 'fetches incidents' do
      response = instance_double(Faraday::Response, body: { 'incidents' => [] })
      allow(conn).to receive(:get).with('/incidents', { limit: 25, offset: 0 }).and_return(response)
      result = client.list_incidents
      expect(result[:result]).to eq({ 'incidents' => [] })
    end

    it 'passes status filters' do
      response = instance_double(Faraday::Response, body: { 'incidents' => [] })
      allow(conn).to receive(:get).with('/incidents', hash_including('statuses[]' => ['triggered'])).and_return(response)
      result = client.list_incidents(statuses: ['triggered'])
      expect(result[:result]).to eq({ 'incidents' => [] })
    end
  end

  describe '#get_incident' do
    it 'fetches a single incident' do
      response = instance_double(Faraday::Response, body: { 'incident' => { 'id' => 'P123' } })
      allow(conn).to receive(:get).with('/incidents/P123').and_return(response)
      result = client.get_incident(id: 'P123')
      expect(result[:result]['incident']['id']).to eq('P123')
    end
  end

  describe '#create_incident' do
    it 'creates an incident' do
      response = instance_double(Faraday::Response, body: { 'incident' => { 'id' => 'P456' } })
      allow(conn).to receive(:post).with('/incidents', hash_including(:incident)).and_return(response)
      result = client.create_incident(title: 'Test', service_id: 'SVC1')
      expect(result[:result]['incident']['id']).to eq('P456')
    end
  end

  describe '#update_incident' do
    it 'updates an incident' do
      response = instance_double(Faraday::Response, body: { 'incident' => { 'status' => 'acknowledged' } })
      allow(conn).to receive(:headers).and_return({})
      allow(conn).to receive(:put).with('/incidents/P123', hash_including(:incident)).and_return(response)
      result = client.update_incident(id: 'P123', from: 'user@example.com', status: 'acknowledged')
      expect(result[:result]['incident']['status']).to eq('acknowledged')
    end
  end

  describe '#snooze_incident' do
    it 'snoozes an incident' do
      response = instance_double(Faraday::Response, body: { 'incident' => { 'status' => 'acknowledged' } })
      allow(conn).to receive(:headers).and_return({})
      allow(conn).to receive(:post).with('/incidents/P123/snooze', { duration: 3600 }).and_return(response)
      result = client.snooze_incident(id: 'P123', from: 'user@example.com', duration: 3600)
      expect(result[:result]).to have_key('incident')
    end
  end

  describe '#list_incident_notes' do
    it 'fetches notes' do
      response = instance_double(Faraday::Response, body: { 'notes' => [] })
      allow(conn).to receive(:get).with('/incidents/P123/notes').and_return(response)
      result = client.list_incident_notes(id: 'P123')
      expect(result[:result]['notes']).to eq([])
    end
  end

  describe '#list_incident_alerts' do
    it 'fetches alerts' do
      response = instance_double(Faraday::Response, body: { 'alerts' => [] })
      allow(conn).to receive(:get).with('/incidents/P123/alerts', { limit: 25, offset: 0 }).and_return(response)
      result = client.list_incident_alerts(id: 'P123')
      expect(result[:result]['alerts']).to eq([])
    end
  end
end
