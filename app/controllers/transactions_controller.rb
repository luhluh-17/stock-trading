class TransactionsController < ApplicationController
  before_action :set_transaction, only: %i[show edit update destroy]

  def index
    @transactions = current_user.role == 'admin' ? Transaction.all : current_user.transactions
  end

  def show; end

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.user_id = current_user.id
    if @transaction.save
      # Update Paid Price
      new_price = @transaction.price * @transaction.amount
      @transaction.update(price: new_price)

      # Update User
      new_balance = (current_user.balance - @transaction.price).round(2)
      current_user.update(balance: new_balance)

      # Subtract Amount in Product
      product = @transaction.product
      new_amount = (product.amount - @transaction.amount).round(2)
      product.update(amount: new_amount)

      # Add Stock in Portfolio
      symbol = @transaction.product.symbol
      stock = current_user.stocks.find_by(symbol:)

      if stock.nil?
        Stock.create(symbol:, amount: @transaction.amount, user_id: current_user.id)
      else
        new_amount = (stock.amount + @transaction.amount).round(2)
        stock.update(amount: new_amount)
      end

      redirect_to transactions_path, notice: 'Transaction successfull'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @transaction.update(transaction_params)
      redirect_to @transaction, notice: 'Transaction has been updated'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @transaction.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  def transaction_params
    params.require(:transaction).permit(:user_id, :product_id, :price, :amount)
  end
end
