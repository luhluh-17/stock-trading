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

  def update_status
    @user = User.find(params[:id])
    @user.update(status: params[:status])
    redirect_to admin_path, notice: "Status changed to #{@user.status}"
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def restrict_action
    redirect_to root_path unless current_user.admin? 
  end

  def user_params
      params.require(:user).permit(:email, :password, :status, :balance)
  end
end
