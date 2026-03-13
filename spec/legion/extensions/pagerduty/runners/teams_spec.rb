# frozen_string_literal: true

RSpec.describe Legion::Extensions::Pagerduty::Runners::Teams do
  let(:client) { Legion::Extensions::Pagerduty::Client.new(token: 'test-token') }
  let(:conn) { instance_double(Faraday::Connection) }

  before { allow(client).to receive(:connection).and_return(conn) }

  describe '#list_teams' do
    it 'fetches teams' do
      response = instance_double(Faraday::Response, body: { 'teams' => [] })
      allow(conn).to receive(:get).with('/teams', { limit: 25, offset: 0 }).and_return(response)
      result = client.list_teams
      expect(result[:result]['teams']).to eq([])
    end
  end

  describe '#get_team' do
    it 'fetches a single team' do
      response = instance_double(Faraday::Response, body: { 'team' => { 'id' => 'T1' } })
      allow(conn).to receive(:get).with('/teams/T1').and_return(response)
      result = client.get_team(id: 'T1')
      expect(result[:result]['team']['id']).to eq('T1')
    end
  end

  describe '#add_member' do
    it 'adds a member' do
      response = instance_double(Faraday::Response, status: 204)
      allow(conn).to receive(:put).with('/teams/T1/users/U1', { role: 'member' }).and_return(response)
      result = client.add_member(team_id: 'T1', user_id: 'U1')
      expect(result[:result]).to be true
    end
  end

  describe '#remove_member' do
    it 'removes a member' do
      response = instance_double(Faraday::Response, status: 204)
      allow(conn).to receive(:delete).with('/teams/T1/users/U1').and_return(response)
      result = client.remove_member(team_id: 'T1', user_id: 'U1')
      expect(result[:result]).to be true
    end
  end
end
