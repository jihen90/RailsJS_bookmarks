class TypesController < ApplicationController
  before_action :set_type, only: %i[ show edit update destroy ]
  def index
    @type = Type.new
  end

  def show
  end

  def create
    @type = Type.new(type_params)
    respond_to do |format|
      if @type.save!
        format.html { redirect_to root_path}
      end
    end
  end

  def new
    @type = Type.new
  end

  def edit
  end
end

  private
  def type_params
    params.require(:type).permit(:name)
  end

  def set_type
    @category = Type.find(params[:id])
  end