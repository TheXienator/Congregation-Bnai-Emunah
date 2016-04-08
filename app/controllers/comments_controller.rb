class CommentsController < ApplicationController
  
  def comment_params
    params.require(:comment).permit(:content, :family_id)
  end
  
  def create
    @family = Family.find(params[:family_id])
    @comment = @family.comments.create(comment_params)
    redirect_to family_path(@family)
  end
  
  def index
    # @comments = Comment.all
    
    @comments = Comment.order(:created_at)
    # @family.order(:created_at).reverse_order
  end
end
