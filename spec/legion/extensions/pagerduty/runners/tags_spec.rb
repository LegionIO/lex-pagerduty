# frozen_string_literal: true

RSpec.describe Legion::Extensions::Pagerduty::Runners::Tags do
  let(:client) { Legion::Extensions::Pagerduty::Client.new(token: 'test-token') }
  let(:conn) { instance_double(Faraday::Connection) }

  before { allow(client).to receive(:connection).and_return(conn) }

  describe '#list_tags' do
    it 'fetches tags' do
      response = instance_double(Faraday::Response, body: { 'tags' => [] })
      allow(conn).to receive(:get).with('/tags', { limit: 25, offset: 0 }).and_return(response)
      result = client.list_tags
      expect(result[:result]['tags']).to eq([])
    end
  end

  describe '#create_tag' do
    it 'creates a tag' do
      response = instance_double(Faraday::Response, body: { 'tag' => { 'id' => 'TAG1' } })
      allow(conn).to receive(:post).with('/tags', { tag: { type: 'tag', label: 'production' } }).and_return(response)
      result = client.create_tag(label: 'production')
      expect(result[:result]['tag']['id']).to eq('TAG1')
    end
  end

  describe '#delete_tag' do
    it 'deletes a tag' do
      response = instance_double(Faraday::Response, status: 204)
      allow(conn).to receive(:delete).with('/tags/TAG1').and_return(response)
      result = client.delete_tag(id: 'TAG1')
      expect(result[:result]).to be true
    end
  end
end
