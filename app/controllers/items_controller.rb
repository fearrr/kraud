class ItemsController < ApplicationController
  def index
    @kombikorm = Type.where(section_name:"Комбикормовое оборудование")
    @pellet = Type.where(section_name:"Пеллетное оборудование")
  end
  def new
    @item =Item.new
    @sections = Type.uniq.pluck(:section_name)
    @types = Type.where("section_name = ?", Type.first.section_name)
  end
  def create
    @item = Item.new(items_params)
    if @item.save
      # Handle a successful save.
      flash[:success] = "Материал добавлен"
      redirect_to items_url
    else
      render 'new'
    end
  end
  def update_types
    @types = Type.where("section_name = ?", params[:section])
    respond_to do |format|
      format.js
    end
  end

  private
  def items_params
    params.require(:item).permit(:section, :type_id, :body)
  end
end
