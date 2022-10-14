class StocksController < ApplicationController
  before_action :set_stock,
                only: %i[show edit update destroy]

  def index
    @stocks = Stock.all
  end

  def show; end

  def new
    @stock = Stock.new
  end

  def create
    @stock = Stock.new(stock_params)
    @stock = current_user.id

    if @stock.save
      redirect_to @stock, notice: "#{@stock.ticker} has been added to your portfolio"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @stock.update(stock_params)
      redirect_to @stock, notice: "#{@stock.ticker} has been updated"
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
    params.require(:stock).permit(:ticker, :amount)
  end
end
