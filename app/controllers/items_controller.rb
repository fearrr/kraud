class ItemsController < ApplicationController
  def index
  end

  def show
    @item = Item.find(params[:id])
    @type = Type.find(@item.type_id)
  end

  def new
    @item =Item.new
    @sections = Type.uniq.pluck(:section_name)
    @types = Type.where("section_name = ?", Type.first.section_name)
  end

  def create
    @sections = Type.uniq.pluck(:section_name)
    @types = Type.where("section_name = ?", Type.first.section_name)

    @item = Item.new(items_params)
    if @item.save
      # Handle a successful save.
      flash[:success] = "Материал добавлен"
      redirect_to types_url
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
    params.require(:item).permit(:section, :body, :title, :type_id)
  end
end
