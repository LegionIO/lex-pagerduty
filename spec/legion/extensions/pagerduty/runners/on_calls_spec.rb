# frozen_string_literal: true

RSpec.describe Legion::Extensions::Pagerduty::Runners::OnCalls do
  let(:client) { Legion::Extensions::Pagerduty::Client.new(token: 'test-token') }
  let(:conn) { instance_double(Faraday::Connection) }

  before { allow(client).to receive(:connection).and_return(conn) }

  describe '#list_on_calls' do
    it 'fetches on-calls' do
      response = instance_double(Faraday::Response, body: { 'oncalls' => [] })
      allow(conn).to receive(:get).with('/oncalls', { limit: 25, offset: 0 }).and_return(response)
      result = client.list_on_calls
      expect(result[:result]['oncalls']).to eq([])
    end
  end
end
