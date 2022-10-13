module ApplicationHelper
  def display_access_level(is_verified)
    return 'Trader' if is_verified

    'Buyer'
  end
end
