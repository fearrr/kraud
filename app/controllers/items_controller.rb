class ItemsController < ApplicationController
  def index
  end

  def show
    @item = Item.find(params[:id])
    @type = Type.find(@item.type_id)

    parser = @item.body


    @table = parser.slice(parser.index('<thead>')..parser.index('</table>')-1) if parser.index('<thead>')

    if parser.index('<section class="description"')
      @description = parser.slice(parser.index('<section class="description"')..parser.index('</section>')+10)
      parser = parser.sub(@description, '')
    end
    if parser.index('<section class="features"')
      @features = parser.slice(parser.index('<section class="features"')..parser.index('</section>')+10)
      parser = parser.sub(@features, '')
    end

    if parser.index('<section class="options"')
      @options = parser.slice(parser.index('<section class="options"')..parser.index('</section>')+10)
      parser = parser.sub(@options, '')
    end

    @delivery = parser.slice(parser.index('<section class="delivery"')..parser.index('</section>')+10) if parser.index('<section class="delivery"')

  end

  def new
    @item =Item.new
    @sections = Type.uniq.pluck(:section_name)
    @types = Type.where("section_name = ?", Type.first.section_name)
  end

  def create
    @sections = Type.uniq.pluck(:section_name)
    @types = Type.where("section_name = ?", Type.first.section_name)

    # AttachedAsset.create(attached_params)

    @item = Item.new(items_params)
    if @item.save
      # Handle a successful save.
      flash[:success] = "Материал добавлен"
      redirect_to item_url(@item.id)
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
    @item = Item.find(params[:id])
    @type = Type.find(@item.type_id)
    @types = Type.where("section_name = ?", @type.section_name)
    if @item.update_attributes(items_params)
      # Handle a successful update.
      flash[:success] = "Материал обновлен"
      redirect_to item_url(@item.id)
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
    params.require(:item).permit(:section, :body, :title, :type_id, attached_assets_attributes: [:asset, :asset_file_name])
  end
end
