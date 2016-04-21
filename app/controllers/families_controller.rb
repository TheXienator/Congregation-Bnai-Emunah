class FamiliesController < ApplicationController
  
  before_action :find_family, only: [:show, :edit, :update, :destroy]
  before_action :get_statuses, only: [:edit, :new]

  def show
  end
  
  def index
    @families = Family.order(:name)
  end
  
  def edit 
  end
  
  def update
    @family.update_attributes!(family_params)
    flash[:notice] = "#{@family.name} family was successfully updated."
    redirect_to family_path(@family)
  end
    
  def new
    @family = Family.new
  end
  
  def create
    @family = Family.create!(family_params)
    flash[:notice] = "#{@family.name} family was successfully created."
    redirect_to families_path
  end
  
  def destroy
    @family.destroy
    flash[:notice] = "Family '#{@family.name}' deleted."
    redirect_to families_path
  end
  
  def show_comments
    if !current_user.admin?
      coms = Comment.where("(confidential = ? AND family_id = ?) OR (confidential = ? AND user_id = ? AND family_id = ?)", false, @family.id, true, current_user.id, @family.id).order(:created_at).reverse
    else
      coms = Comment.where("family_id = ?", @family.id).order(:created_at).reverse
    end
  end
  helper_method :show_comments
  
  private
  
    def family_params
      params.require(:family).permit(:name, :people, :status, :phone, :email)
    end
    
    def find_family
      @family = Family.find(params[:id])
    end
    
    def get_statuses
      @statuses = ['New Member', 'Longtime', 'Non-Member', 'Prospective', 
                   'In Reach', 'Friend of BE', 'Ex-Member', 'Deceased']
    end
  
    
end
