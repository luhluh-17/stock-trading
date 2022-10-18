class StocksController < ApplicationController
  before_action :set_stock, only: %i[show edit update destroy]

  def index
    @stocks = current_user.stocks
  end

  def show; end

  def new
    @stock = Stock.new
  end

  # TODO: Fixed Warning
  def create
    @stock = Stock.new(stock_params)
    @stock.user_id = current_user.id

    if @stock.save
      new_balance = (current_user.balance - (params[:stock][:latest].to_f * @stock.amount)).round(2)
      current_user.update(balance: new_balance)

      redirect_to portfolio_path, notice: "#{@stock.symbol} has been added to your portfolio"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @stock.update(stock_params)
      redirect_to @stock, notice: "#{@stock.symbol} has been updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @stock.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def set_stock
    @stock = Stock.find(params[:id])
  end

  def stock_params
    params.require(:stock).permit(:symbol, :amount)
  end
end
