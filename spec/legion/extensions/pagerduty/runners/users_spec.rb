# frozen_string_literal: true

RSpec.describe Legion::Extensions::Pagerduty::Runners::Users do
  let(:client) { Legion::Extensions::Pagerduty::Client.new(token: 'test-token') }
  let(:conn) { instance_double(Faraday::Connection) }

  before { allow(client).to receive(:connection).and_return(conn) }

  describe '#list_users' do
    it 'fetches users' do
      response = instance_double(Faraday::Response, body: { 'users' => [] })
      allow(conn).to receive(:get).with('/users', { limit: 25, offset: 0 }).and_return(response)
      result = client.list_users
      expect(result[:result]['users']).to eq([])
    end
  end

  describe '#get_user' do
    it 'fetches a single user' do
      response = instance_double(Faraday::Response, body: { 'user' => { 'id' => 'U1' } })
      allow(conn).to receive(:get).with('/users/U1').and_return(response)
      result = client.get_user(id: 'U1')
      expect(result[:result]['user']['id']).to eq('U1')
    end
  end

  describe '#create_user' do
    it 'creates a user' do
      response = instance_double(Faraday::Response, body: { 'user' => { 'id' => 'U2' } })
      allow(conn).to receive(:post).with('/users', hash_including(:user)).and_return(response)
      result = client.create_user(name: 'Test User', email: 'test@example.com')
      expect(result[:result]['user']['id']).to eq('U2')
    end
  end

  describe '#delete_user' do
    it 'deletes a user' do
      response = instance_double(Faraday::Response, status: 204)
      allow(conn).to receive(:delete).with('/users/U1').and_return(response)
      result = client.delete_user(id: 'U1')
      expect(result[:result]).to be true
    end
  end

  describe '#list_contact_methods' do
    it 'fetches contact methods' do
      response = instance_double(Faraday::Response, body: { 'contact_methods' => [] })
      allow(conn).to receive(:get).with('/users/U1/contact_methods').and_return(response)
      result = client.list_contact_methods(user_id: 'U1')
      expect(result[:result]['contact_methods']).to eq([])
    end
  end
end
