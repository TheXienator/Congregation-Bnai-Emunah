class FamiliesController < ApplicationController
  
  def family_params
    params.require(:family).permit(:name, :people, :phone, :email)
  end
  
  def show
    
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
    
  end
  
  def destroy
    @family = Family.create!(family_params)
    flash[:notice] = "#{@family.name} Family was successfully created."
    redirect_to family_path
  end
  
end
