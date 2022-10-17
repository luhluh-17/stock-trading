module MarketplaceHelper
  def product_price(price, percentage)
    (price + (price * (percentage / 100.00))).round(2)
  end
end
