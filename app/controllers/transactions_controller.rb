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
      redirect_to @transaction, notice: 'Transaction successfull'
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
