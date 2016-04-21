class TasksController < ApplicationController
  
  before_action :find_user, only: [:create, :edit, :update, :destroy]
  before_action :find_task, only: [:destroy, :edit, :update]
  
  def create
    @task = @user.tasks.create(task_params)
    @task.admin_id = current_user.id
    if @task.save
      TaskMailer.notify_task(@user, @task, current_user).deliver
    end
    redirect_to user_path(@user)
    # else
    #   render 'new'
    # end
  end
  
  def edit
  end
  
  def update
    if @task.update(task_params)
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end
  
  def destroy
    @task.destroy
    redirect_to user_path(@user)
  end
  
  private 
    def task_params
      params.require(:task).permit(:content, :priority, :user_id)
    end
    
    def find_user
      @user = User.find(params[:user_id])
    end
      
    def find_task
      @task = @user.tasks.find(params[:id])
    end
    
end
