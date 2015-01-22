class TypesController < ApplicationController
# encoding: UTF-8
  def edit
    @type = Type.find(params[:id])
  end

  def update
    @type = Type.find(params[:id])
    if @type.update_attributes(types_params)
      # Handle a successful update.
      flash[:success] = "Раздел обновлен"
      redirect_to types_url
    else
      render 'edit'
    end
  end
  def destroy
    @type = Type.find(params[:id])
    @type.destroy
    flash[:success] = "Раздел удален"
    redirect_to types_url
  end

  def kombikorm
    @kombikorm = Type.where(section_name: "Комбикормовое оборудование")
  end

  def pellet
    @pellet = Type.where(section_name: "Пеллетное оборудование")
  end

  def index
    @kombikorm = Type.where(section_name: "Комбикормовое оборудование").limit(2)
    @pellet = Type.where(section_name: "Пеллетное оборудование").limit(2)
    @sections = Type.uniq.pluck(:section_name)

    @pellet_items = Item.where("section = ?", @pellet.first.section_name)
  end

  def show
    @type = Type.find(params[:id])
    @items = Item.where("type_id = ?", params[:id])
  end

  def new
    @type = Type.new
  end

  def create
    @type = Type.new(types_params)
    if @type.save
      # Handle a successful save.
      flash[:success] = "Категория добавлена"
      redirect_to types_url
    else
      render 'new'
    end
  end
end




private
def types_params
  params.require(:type).permit(:title, :section_name)
end
