class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :restrict_action

  def index
    @users = User.all.order('status')
  end

  def pending
    @users = User.all.where(:role => 0, :status => "pending")
  end

  def verified
    @users = User.all.where(:role => 0, :status => "verified")
  end

  def show
    @user = User.find(params[:id])
  end

  def change_status
    @user = User.find(params[:id])

    redirect_to root_path
  end

  private

  def restrict_action
    redirect_to root_path unless current_user.admin? 
  end

  def user_params
      params.require(:user).permit(:email, :name, :password, :status, :balance)
  end
end
