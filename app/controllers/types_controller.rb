class TypesController < ApplicationController
  before_action :set_type, only: %i[ show edit update destroy ]
  def index
    @type = Type.new
    @types = Type.all
  end

  def show
  end

  def new
    @type = Type.new
  end

  def edit
  end

  def create
    @type = Type.new(type_params)
    respond_to do |format|
      if @type.save!
        format.html { redirect_to types_path}
      end
    end
  end

  def update
    respond_to do |format|
      if @type.update!(type_params)
        format.html {redirect_to types_path}
      end
    end
  end

  def destroy
    @type.destroy
    respond_to do |format|
      format.html { redirect_to types_path}
      format.json { head :no_content }
    end
  end

  private

  def set_type
    @type = Type.find(params[:id])
  end

  def type_params
    params.require(:type).permit(:name)
  end
  
end