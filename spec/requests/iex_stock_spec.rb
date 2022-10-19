require 'rails_helper'

RSpec.describe 'IexStocks', type: :request do
  describe 'GET /index' do
    it 'has a 200 status code' do
      get iex_stock_path, params: { symbol: 'AMD' }
      expect(response.status).to eq(200)
    end
  end
end
