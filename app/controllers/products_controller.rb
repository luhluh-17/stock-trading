class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]

  def index
    @products = current_user.role == 'admin' ? Product.all : current_user.products
  end

  def show; end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user_id = current_user.id

    if @product.save
      stock = current_user.stocks.find_by(symbol: @product.symbol)
      new_amount = (stock.amount - @product.amount).round(2)
      stock.update(amount: new_amount)

      redirect_to portfolio_path, notice: "#{@product.symbol} has been added to the Marketplace"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: "#{@product.ticker} has been updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:symbol, :amount, :percentage)
  end
end
