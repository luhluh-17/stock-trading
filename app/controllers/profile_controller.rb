class ProfileController < ApplicationController
  def index; end

  def deposit
    amount = params[:user][:amount].to_f
    new_balance = current_user.balance + amount
    current_user.update(balance: new_balance)
    redirect_to profile_path, notice: "You have successfully added #{amount} to your balance"
  end
end
