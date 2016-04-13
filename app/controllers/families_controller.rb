class FamiliesController < ApplicationController
  
  before_action :find_family, only: [:show, :edit, :update, :destroy]
  
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
    flash[:notice] = "#{@family.name} Family was successfully created."
    redirect_to families_path
  end
  
  def destroy
    @family.destroy
    flash[:notice] = "Family '#{@family.name}' deleted."
    redirect_to families_path
  end
  
  private
  
    def family_params
      params.require(:family).permit(:name, :people, :status, :phone, :email)
    end
    
    def find_family
      @family = Family.find(params[:id])
    end
  
end
