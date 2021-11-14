class BookmarksController < ApplicationController
  before_action :set_bookmark, only: %i[ show edit update destroy ]
  
  def index
    @bookmarks = Bookmark.all
    @bookmark = Bookmark.new
    @types = Type.all
    @categories = Category.all
    @group_By_Types = Type.joins(:bookmarks).group(:name).count
  end

  def show
  end

  def create
    @bookmarks = Bookmark.all
    @bookmark = Bookmark.new(bookmark_params)
    respond_to do |format|
    if @bookmark.save!
    format.js {render nothing: true}
    end
  end
end

  def new
    @bookmark = Bookmark.new
  end

  def edit
    @types = Type.all
    @categories = Category.all
  end

  def destroy
    @bookmark.destroy
    respond_to do |format|
      format.html { redirect_to root_path}
      format.json { head :no_content }
    end
  end

  def update
    respond_to do |format|
      if @bookmark.update!(bookmark_params)
        format.html {redirect_to root_path}
      end
  end
end

  private
  def bookmark_params
    params.require(:bookmark).permit(:name, :url, :category_id, :type_id)
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end
end
