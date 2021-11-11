class BookmarksController < ApplicationController
  before_action :set_bookmark, only: %i[ show edit update destroy ]
  
  def index
    @bookmarks = Bookmark.all
    @bookmark = Bookmark.new
    @types = Type.all
    @categories= Category.all
  end

  def show
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    respond_to do |format|
      if @bookmark.save!
        format.html { redirect_to root_path}
      end
    end
  end

  def new
    @bookmark = Bookmark.new
  end

  def edit
  end
end

  private
  def bookmark_params
    params.require(:bookmark).permit(:name, :url, :category_id, :type_id)
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

