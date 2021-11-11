class CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show edit update destroy ]
  def index
    @category = Category.new
  end

  def show
  end

  def create
    @category = Category.new(category_params)
    respond_to do |format|
      if @category.save!
        format.html { redirect_to root_path}
      end
    end
  end

  def new
    @category = Category.new
  end

  def edit
  end
end

  private
  def category_params
    params.require(:category).permit(:name)
  end

  def set_category
    @category = Category.find(params[:id])
  end