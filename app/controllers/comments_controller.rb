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
    @comments = Comment.order(:created_at)
  end
end
