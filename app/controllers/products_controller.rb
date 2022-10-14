class ProductsController < ApplicationController
  before_action :set_product,
                only: %i[show edit update destroy]

  def index
    @products = Product.all
  end

  def show; end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user_id = current_user.id

    redirect_to @product, notice: "#{@product.ticker} has been added to the Marketplace" if @product.save
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
    params.require(:product).permit(:ticker, :amount, :percentage)
  end
end
