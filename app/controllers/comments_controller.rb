class CommentsController < ApplicationController
  
  before_action :find_family, only: [:create, :edit, :update, :destroy]
  before_action :find_comment, only: [:destroy, :edit, :update]
  
  def create
    @comment = @family.comments.create(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    redirect_to family_path(@family)
    # else
    #   render 'new'
    # end
  end
  
  def new
    @comment = Comment.new
  end
  
  def index
    if !current_user.admin?
      @comments = Comment.where("confidential = ? OR user_id = ?", false, current_user.id).order(:created_at).reverse
    else
      @comments = Comment.order(:created_at).reverse
    end
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
      params.require(:comment).permit(:content, :confidential)
    end
    
    def find_family
      @family = Family.find(params[:family_id])
    end
      
    def find_comment
      @comment = @family.comments.find(params[:id])
    end
    
end
