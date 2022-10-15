module ApplicationHelper
  def display_access_level(status)
    return 'Trader' if status == 'verified'

    'Buyer'
  end
end
