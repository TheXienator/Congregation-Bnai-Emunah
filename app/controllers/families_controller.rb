class FamiliesController < ApplicationController
  
  before_action :find_family, only: [:show, :edit, :update, :destroy]
  
  def show
  end
  
  def index
    @families = Family.order(:name)
    # if (params[:status] && @families.collect(&:status).include?(params[:status]))
    #   @family = Family.send(params[:status])
    # else
    #   @family = Family.all
    # end
    
    # if params[:status] == nil
    #   @family = Family.stu
    # else
    #   @family = Hash[params[:status]].keys
    # end
    

    new_params = {}
    need_redirect = false
    if params[:status].nil? && !session[:status].nil?
      new_params[:status] = session[:status]
      need_redirect = true
    end
    
    # Set sessions
    if !params[:status].nil?
      session[:status] = params[:status]
      new_params[:status] = params[:status]
    end

    
    if need_redirect
      redirect_to family_path(new_params)
    end



    # @family = params[:status].nil? ? Family.all : Family.where(rating: params[:status].keys)
    # @checked = params[:status].nil? ? @families : params[:status].keys

    
    # @all_status = Family.all_status
    # @status = @all_status

    # if params.fetch("status", false)
    #   @status = params[:status].keys
    # end

    # sess_status = session.fetch("all_status", @all_status)

    # if (@status == @all_status and
    #     (sess_status != @all_status))
    #   flash.keep
    #   ratings_params = Hash[*sess_status.collect {|k| [k, 'yes']}.flatten]
    #   return redirect_to family_path(nil, {:status => ratings_params})
    # end

    # @movies = Family.where(:rating => @status)

    # session[:movies_ratings] = @status
    
    
    
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
