class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
    @user_tasks = Task.where(user_id: @user.id)
    @pending_tasks = @user_tasks.where(completed: false)
    @completed_tasks = @user_tasks.where(completed: true)
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
    @user_tasks = Task.where(user_id: @user.id)
    @pending_tasks = @user_tasks.where(completed: false)
    @completed_tasks = @user_tasks.where(completed: true)
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.create!(user_params)
    flash[:notice] = "#{@user.name} was successfully created."
    redirect_to users_path
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "User '#{@user.name}' deleted."
    redirect_to users_path
  end

  private
  
    def user_params
      params.require(:user).permit(:name, :email, :phone, :admin, :password, :password_confirmation)
    end
end
