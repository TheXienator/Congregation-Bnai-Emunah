class CommentsController < ApplicationController
  
  before_action :find_family, only: [:create, :edit, :update, :destroy]
  before_action :find_comment, only: [:destroy, :edit, :update]
  
  def create
    @comment = @family.comments.create(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to family_path(@family)
    else
      render 'new'
    end
  end
  
  def index
    @comments = Comment.order(:created_at)
  end
  
  def edit
  end
  
  def update
    if @comment.update(comment_params)
      redirect_to family_path(@family)
    else
      render 'edit'
    end
  end
  
  def destroy
    @comment.destroy
    redirect_to family_path(@family)
  end
  
  private 
    def comment_params
      params.require(:comment).permit(:content)
    end
    
    def find_family
      @family = Family.find(params[:family_id])
    end
      
    def find_comment
      @comment = @family.comments.find(params[:id])
    end
    
end
