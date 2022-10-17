class MarketplaceController < ApplicationController
  def index
    @products = Product.all
  end
end
