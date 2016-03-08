class FamiliesController < ApplicationController
  
  def family_params
    params.require(:family).permit(:name, :people, :phone, :email)
  end
  
  def show
    id = params[:id]
    @family = Family.find(id)
  end
  
  def index
    @families = Family.all
  end
  
  def edit 
    
  end
  
  def update
    
  end
    
  def new
    
  end
  
  def create
    @family = Family.create!(family_params)
    # flash[:notice] = "#{@family.name} Family was successfully created."
    redirect_to families_path
  end
  
  def destroy
    @family = Family.find(params[:id])
    @family.destroy
    flash[:notice] = "Family '#{@family.name}' deleted."
    redirect_to families_path
  end
  
end
