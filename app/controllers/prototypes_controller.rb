class PrototypesController < ApplicationController

  def index
    @prototypes = Prototype.all
  end
  
  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
        render 'new'
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
  end
  
  def edit
    @prototype = Prototype.find(params[:id])
  end

  def update
    @prototype = Prototype.find(params[:id])
    @prototype.update(prototype_params)
    if current_user.update(params[:id])
      redirect_to prototype_path(prototype.id)
    else
        render :edit
    end
  end

  def destroy
    @prototype = Prototype.find(params[:id])
    @prototype.destroy
    if prototype.destroy(params[:id])
      redirect_to root_path
    else
        render :edit
    end
  end

  private
    def prototype_params
      params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
    end
end