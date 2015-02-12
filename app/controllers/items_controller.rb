class ItemsController < ApplicationController
  before_action :logged_in_admin, only: [:edit, :update, :new]
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
    require 'nokogiri'

    @item = Item.find(params[:id])
    @type = Type.find(@item.type_id)
    @part = Part.find(@type.part_id)
    parser = Nokogiri::HTML(@item.body)

    @description = parser.css('section.description')
    @features = parser.css('section.features')
    @delivery = parser.css('section.delivery')
    @options = parser.css('section.options')
    @thead = parser.xpath('//table/thead')
    @tbody = parser.xpath('//table/tbody')




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
    @types = @part.types.all
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


  def dublicate
    @item = Item.find(params[:id])
    if Item.create(:public => @item.public, :section => @item.section, :body => @item.body, :title => @item.title, :type_id => @item.type_id, :part_id => @item.part_id)
      flash[:success] = "Материал дублирован"
      redirect_to type_url(Type.find(@item.type_id))
    end
  end

  private
  def items_params
    params.require(:item).permit(:public, :section, :body, :title, :type_id, :part_id, attached_assets_attributes: [:asset, :asset_file_name])
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
