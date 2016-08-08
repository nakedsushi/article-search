require 'rails_helper'

RSpec.describe Search, :type => :model do

  describe 'query' do
    it 'executes an HTTParty query' do
      query = 'accio banana'
      escaped_query = 'accio+banana'
      expect(HTTParty).to receive(:get).with(Search::URL + escaped_query)

      Search.query query
    end
  end

  describe 'extract_audio' do
    it 'returns an array of audio objects if article has them' do
      article = {'title' => 'wasabi kills', 'audio' => [{'url' => 'http://www.www.net'}, { 'url' => 'otherUrl'}]}
      trimmer = double

      allow(Search).to receive(:open)
      allow(File).to receive(:new)
      allow(AudioTrimmer).to receive(:new).and_return(trimmer)
      allow(trimmer).to receive(:trim)

      response = Search.extract_audio(article)
      expect(response.size).to eq(2)
      expect(response).to all(be_a(AudioSerializer))
    end

    it 'returns an empty array if article does not have audio' do
      article = {'title' => 'do re mi'}

      expect(Search.extract_audio(article)).to eq([])
    end
  end
end
