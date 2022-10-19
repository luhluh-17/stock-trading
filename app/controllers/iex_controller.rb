class IexController < ApplicationController
  def stock
    @quote = @client.quote(params[:symbol].upcase)
  rescue IEX::Errors::SymbolNotFoundError => e
    redirect_back_or_to dashboard_path, notice: e.to_s
  end
end
