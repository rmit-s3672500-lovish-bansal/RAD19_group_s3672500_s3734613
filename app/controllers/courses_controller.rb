class CoursesController < ApplicationController
  
  def show
    @course = Course.find(params[:id])
  end

    def create
    @course = Course.new(course_params)
    @course.user = current_user
    if @course.save
      flash[:success] = "Courses Added Successfully"
      redirect_to @course
    else
      render 'new'
    end
  end
  
  def new
     @course = Course.new
  end
  
  private
  def course_params
    params.require(:course).permit(:name, :prerequisite, :Description, category_ids:[], location_ids:[])
  end
end
