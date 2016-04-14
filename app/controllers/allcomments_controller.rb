class AllcommentsController < ApplicationController
  before_action :find_comment, only: [:destroy, :edit, :update]
  
  def new
  end

  def index
    
    Family.order('id').each do |oneFamily|
      if @allcomments == nil
        @allcomments = oneFamily.comments
      end
      @allcomments.append(oneFamily.comments)
    end
    
    # byebug
    
    @allcomments = @allcomments.order(:created_at)
  end
  
end
