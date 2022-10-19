require 'rails_helper'

RSpec.describe 'Stocks', type: :request do
  describe 'GET /index' do
    it 'has a 200 status code' do
      get stocks_path
      expect(response.status).to eq(200)
    end
  end
end
