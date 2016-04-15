class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def edit 
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update_attributes!(user_params)
    flash[:notice] = "#{@user.name} was successfully updated."
    redirect_to user_path(@user)
  end
  
  def profile
    @user = current_user
  end
  
  def new
    @user = User.new
  end
  
  def create
  end
  
  def destroy 
    
  end

  private
  
    def user_params
      params.require(:user).permit(:name, :email, :admin)
    end
end
