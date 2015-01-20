class TypesController < ApplicationController
# encoding: UTF-8
  def kombikorm
    @kombikorm = Type.where(section_name: "Комбикормовое оборудование")
  end
  def pellet
    @pellet = Type.where(section_name: "Пеллетное оборудование")
  end
  def index
    @kombikorm = Type.where(section_name: "Комбикормовое оборудование")
    @pellet = Type.where(section_name: "Пеллетное оборудование")
    @sections = Type.uniq.pluck(:section_name)
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
      redirect_to items_url
    else
      render 'new'
    end
  end
end



private
def types_params
  params.require(:type).permit(:title, :section_name)
end
