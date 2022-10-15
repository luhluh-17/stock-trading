class DashboardController < ApplicationController
  def index
    @stocks_lists = @client.stock_market_list(:mostactive)
  end
end
