class FamiliesController < ApplicationController
  
  def family_params
    params.require(:family).permit(:name, :people, :status, :phone, :email)
  end
  
  def show
    @family = Family.find(params[:id])
  end
  
  def index
    # @families = Family.order(:name)
    
    @families = Family.order(:created_at)
    # @family.order(:created_at).reverse_order
  end
  
  def edit 
    @family = Family.find(params[:id])
  end
  
  def update
    
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
    @family = Family.find(params[:id])
    @family.destroy
    flash[:notice] = "Family '#{@family.name}' deleted."
    redirect_to families_path
  end
  
end
