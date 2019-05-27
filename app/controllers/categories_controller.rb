class CategoriesController < ApplicationController
    def create
      @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Category Added Successfully"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
     @category = Category.new
  end
  
  def edit
  end


  private
  def category_params
    params.require(:category).permit(:title)
  end
end
