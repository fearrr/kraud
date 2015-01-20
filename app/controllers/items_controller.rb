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

  def edit
    @sections = Type.uniq.pluck(:section_name)
    @item = Item.find(params[:id])
    @type = Type.find(@item.type_id)

    @types = Type.where("section_name = ?", @type.section_name)
  end

  def update
    @sections = Type.uniq.pluck(:section_name)
    @item = Type.find(params[:id])
    @type = Type.find(@item.type_id)
    @types = Type.where("section_name = ?", @type.section_name)
    if @item.update_attributes(items_params)
      # Handle a successful update.
      flash[:success] = "Материал обновлен"
      redirect_to types_url
    else
      render 'edit'
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    flash[:success] = "Материал удален"
    redirect_to types_url
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
