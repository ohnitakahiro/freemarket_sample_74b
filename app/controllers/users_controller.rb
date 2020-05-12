class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.new
  end

  def show
  end
  
  def create
    @user = User.new(user_params)
  end

  def destroy
  end

  def edit
  end

  def update
  end

  private
  def user_params
    params.require(:user).permit(:name, :email,:password )
  end
  
end

 