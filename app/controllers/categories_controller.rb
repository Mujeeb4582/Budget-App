class CategoriesController < ApplicationController
  def index
    @categories = current_user.categories.order(updated_at: params[:order] || :desc)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.user = current_user

    if @category.save
      flash[:notice] = 'Category was successfully created!'
    else
      flash[:alert] = 'Category could not be created!'
    end
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
