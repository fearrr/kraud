class ItemsController < ApplicationController
  def index
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    flash[:success] = "Материал удален"
    redirect_to parts_url
  end

  def update_types
    @types = Type.where("part_id = ?", params[:part])
    respond_to do |format|
      format.js
    end
  end

  def show
    @item = Item.find(params[:id])
    @type = Type.find(@item.type_id)
    @part = Part.find(@type.part_id)
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

    @sections = Part.uniq.pluck(:section)
    @parts = Part.where("section = ?", Part.first.section)
    @types = @parts.first.types.all
  end

  def create
    @sections = Part.uniq.pluck(:section)
    @parts = Part.where("section = ?", Part.first.section)
    @types = @parts.first.types.all

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
    @item = Item.find(params[:id])
    @type = Type.find(@item.type_id)
    @part = Part.find(@type.part_id)

    @sections = Part.uniq.pluck(:section)
    @parts = Part.where("section = ?", @item.section)
    @types = @parts.first.types.all
  end

  def update
    @item = Item.find(params[:id])
    @type = Type.find(@item.type_id)
    @part = Part.find(@type.part_id)

    @sections = Part.uniq.pluck(:section)
    @parts = Part.where("section = ?", @item.section)
    @types = @parts.first.types.all

    if @item.update_attributes(items_params)
      # Handle a successful update.
      flash[:success] = "Материал обновлен"
      redirect_to item_url(@item.id)
    else
      render 'edit'
    end
  end

  def publish
    @item = Item.find(params[:id])
    if @item.public
      @item.update_attributes(:public => false)
      flash[:success] = "Материал снят с публикации"
    else
      @item.update_attributes(:public => true)
      flash[:success] = "Материал опубликован"
    end
    redirect_to item_url(@item.id)
  end

  private
  def items_params
    params.require(:item).permit(:public, :section, :body, :title, :type_id, :part_id, attached_assets_attributes: [:asset, :asset_file_name])
  end
end
