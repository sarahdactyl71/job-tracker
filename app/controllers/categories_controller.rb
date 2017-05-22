class CategoriesController < ApplicationController
  before_action :set_category, only: [:destroy, :edit, :update]

  def show
    @category = Category.find(params[:id])
  end

  def edit
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def update
    @category = Category.find(params[:id])
    @category.update(category_params)
    if @category.save
      flash[:success] = "#{@category.title} updated!"
      redirect_to categories_path
    else
      render :edit
    end
  end

  def index
    @categories = Category.all
  end

  def destroy
    category = Category.find(params[:id])
    category.destroy

    flash[:success] = "#{category.title} was successfully deleted!"
    redirect_to categories_path
  end

  private

    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:title)
    end
end
