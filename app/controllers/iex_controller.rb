class IexController < ApplicationController
  def stock
    @quote = @client.quote(params[:symbol].upcase)
  end
end
