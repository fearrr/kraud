class PartsController < ApplicationController
  # encoding: UTF-8
  before_action :logged_in_admin, only: [:edit, :update, :new]
  def edit
    @part = Part.find(params[:id])
  end

  def update
    @part = Part.find(params[:id])
    if @part.update_attributes(parts_params)
      # Handle a successful update.
      flash[:success] = "Раздел обновлен"
      redirect_to parts_url
    else
      render 'edit'
    end
  end

  def destroy
    @part = Part.find(params[:id])
    @part.destroy
    flash[:success] = "Раздел удален"
    redirect_to parts_url
  end

  def index
    @kombikorm = Part.where(section: "Комбикормовое оборудование").limit(2)
    @pellet = Part.where(section: "Пеллетное оборудование").limit(2)
    @kombikorm_all = Part.where(section: "Комбикормовое оборудование")
    @pellet_all = Part.where(section: "Пеллетное оборудование")
    # @sections = Part.uniq.pluck(:section)
  end

  def show
    @part = Part.find(params[:id])
    @types = @part.types.all
    @kombikorm = Part.where(section: "Комбикормовое оборудование")
    @pellet = Part.where(section: "Пеллетное оборудование")
  end

  def new
    @part = Part.new
  end

  def create
    @part = Part.new(parts_params)
    if @part.save
      # Handle a successful save.
      flash[:success] = "Раздел добавлен"
      redirect_to parts_url
    else
      render 'new'
    end
  end

  def kombikorm
    @kombikorm = Part.where(section: "Комбикормовое оборудование")
    @pellet = Part.where(section: "Пеллетное оборудование")
  end

  def pellet
    @kombikorm = Part.where(section: "Комбикормовое оборудование")
    @pellet = Part.where(section: "Пеллетное оборудование")
  end

  private
  def parts_params
    params.require(:part).permit(:title, :section)
  end
  # Confirms a logged-in user.
  def logged_in_admin
    unless logged_in?
      store_location
      flash[:danger] = "Зайдите как администратор"
      redirect_to login_url
    end
  end
end
