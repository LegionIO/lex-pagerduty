# frozen_string_literal: true

RSpec.describe Legion::Extensions::Pagerduty::Runners::Schedules do
  let(:client) { Legion::Extensions::Pagerduty::Client.new(token: 'test-token') }
  let(:conn) { instance_double(Faraday::Connection) }

  before { allow(client).to receive(:connection).and_return(conn) }

  describe '#list_schedules' do
    it 'fetches schedules' do
      response = instance_double(Faraday::Response, body: { 'schedules' => [] })
      allow(conn).to receive(:get).with('/schedules', { limit: 25, offset: 0 }).and_return(response)
      result = client.list_schedules
      expect(result[:result]['schedules']).to eq([])
    end
  end

  describe '#get_schedule' do
    it 'fetches a single schedule' do
      response = instance_double(Faraday::Response, body: { 'schedule' => { 'id' => 'SCH1' } })
      allow(conn).to receive(:get).with('/schedules/SCH1', {}).and_return(response)
      result = client.get_schedule(id: 'SCH1')
      expect(result[:result]['schedule']['id']).to eq('SCH1')
    end
  end

  describe '#delete_schedule' do
    it 'deletes a schedule' do
      response = instance_double(Faraday::Response, status: 204)
      allow(conn).to receive(:delete).with('/schedules/SCH1').and_return(response)
      result = client.delete_schedule(id: 'SCH1')
      expect(result[:result]).to be true
    end
  end

  describe '#list_schedule_overrides' do
    it 'fetches overrides' do
      response = instance_double(Faraday::Response, body: { 'overrides' => [] })
      allow(conn).to receive(:get).with('/schedules/SCH1/overrides',
                                        since: '2026-01-01', until: '2026-01-31').and_return(response)
      result = client.list_schedule_overrides(id: 'SCH1', since_time: '2026-01-01', until_time: '2026-01-31')
      expect(result[:result]['overrides']).to eq([])
    end
  end
end
