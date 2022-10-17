module ApplicationHelper
  def display_access_level(status)
    return 'Trader' if status == 'verified'

    'Buyer'
  end

  def calculate_stock_price(amount, price)
    amount * price
  end
end
