class CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show edit update destroy ]
  before_action :set_select, only: %i[ new edit create update index ]
  
  def index
    @category = Category.new
    @categories = Category.all
  end

  def results
    @categories = Category.all
    @categories = Category.where(category_id: params[:category_id]) if params[:category_id].present?
  end

  def show
    @categories = Category.includes(:bookmarks) 
    @bookmark = Bookmark.find(params[:id])
    @fetchCategory = {  category_name: @category.name, 
                        bookmark_name: @bookmark.name,
                        subcategory: @category.subcategories(@categories)
                      }
    render json: @fetchCategory
  end

  def new
    @category = Category.new
    @categories = Category.all 
  end

  def edit
    @categories = Category.all
  end

  def create
    @category = Category.new(category_params)
    respond_to do |format|
      if @category.save
        format.html { redirect_to categories_path}
      else
        format.html { redirect_to categories_path, notice: "Visibility cannot be blank"}
      end
    end
  end

  def update
    respond_to do |format|
      if @category.update!(category_params)
        format.html { redirect_to categories_path, notice: 'Category updated' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @category.destroy!
        format.html { redirect_to categories_path, notice: 'Category deleted!' }
      else
        format.html { redirect_to categories_path, notice: 'Category could not be deleted' }
      end
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :visibility, :category_id)
  end

  def set_select
    @visibilities = Category.visibilities.keys.to_a
  end

end