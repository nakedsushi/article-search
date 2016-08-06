require 'rails_helper'

RSpec.describe Search, :type => :model do
  pending 'add some examples to (or delete) #{__FILE__}'

  describe 'query' do
    fit 'executes an HTTParty query' do
      query = 'accio banana'
      escaped_query = 'accio+banana'
      expect(HTTParty).to receive(:get).with(escaped_query)

      Search.query query
    end
  end
end
