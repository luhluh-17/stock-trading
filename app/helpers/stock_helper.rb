module StockHelper
  def max_available(balance, price)
    (balance / price.to_f).round(2)
  end
end
