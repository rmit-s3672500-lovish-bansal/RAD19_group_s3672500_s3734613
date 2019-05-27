class LocationsController < ApplicationController
    
  def create
    @location = Location.new(location_params)
    if @location.save
      flash[:success] = "Location Added Successfully"
      redirect_to root_path
    else
      render 'new'
    end
  end
  
  def new
     @location = Location.new
  end

  def show
    @location = Location.find(params[:id])
  end
  
  def edit
  end

private
  def location_params
    params.require(:location).permit(:venue)
  end

 
end
