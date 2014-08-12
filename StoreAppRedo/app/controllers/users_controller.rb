class UsersController < ApplicationController
	def index
    @users = User.all
  end

  def new
    @user = User.new(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "New User Added"
      redirect_to user_path @user
    else
      flash[:notice] = "User Not Addes"
      redirect_to :back
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
    if User.find(params[:id]).delete
      flash[:notice] = "User Deleted"
      redirect_to '/'
    else
      flash[:notice] = "User not deleted"
      redirect_to :back
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
