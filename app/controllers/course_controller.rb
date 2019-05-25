class CourseController < ApplicationController
  def index
  end
  
  def show
    @course = Course.find(params[:id])
  end

  def new
  end
end
