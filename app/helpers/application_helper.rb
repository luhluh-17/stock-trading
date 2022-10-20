module ApplicationHelper
  def user_greeting(user)
    if Time.now.hour >= 7 && Time.now.hour < 12
      "Good Morning, #{user.first_name}!"
    elsif Time.now.hour >= 12 && Time.now.hour < 18
      "Good Afternoon, #{user.first_name}!"
    else
      "Good Evening, #{user.first_name}!"
    end
  end

  def display_access_level(status)
    return 'Trader' if status == 'verified'

    'Buyer'
  end

  def calculate_stock_price(amount, price)
    amount * price
  end

  def get_change_style(value)
    return 'price-change-red' if value.negative?

    'price-change-green'
  end
end
