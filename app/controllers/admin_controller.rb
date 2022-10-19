class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :restrict_action

  # user lists
  def index
    @users = User.all.order('status')
  end

  def pending
    @users = User.all.where(:role => 0, :status => "pending")
  end

  def verified
    @users = User.all.where(:role => 0, :status => "verified")
  end

  def rejected
    @users = User.all.where(:role => 0, :status => "rejected")
  end

  # show user details
  def show
    @user = User.find(params[:id])
  end

  # add user
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to userlist_path, notice: 'User successfully created.' 
    else
      render :new, status: :unprocessable_entity
    end
  end

  # edit user
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to userlist_path, notice: 'User details successfully updated.' 
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # delete user
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to userlist_path, notice: 'User successfully deleted.', status: :see_other
  end

  # change pending to verified / rejected
  def update_status
    @user = User.find(params[:id])
    @user.update(status: params[:status])
    redirect_to admin_path, notice: "Status changed to #{@user.status}."
  end

  private

  def restrict_action
    redirect_to root_path unless current_user.admin? 
  end

  def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :status, :balance)
  end
end
