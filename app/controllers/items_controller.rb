class ItemsController < ApplicationController
  before_action :logged_in_admin, only: [:edit, :update, :new, :destroy_asset]

  def index
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    flash[:success] = "Материал удален"
    redirect_to parts_url
  end

  def update_types
    @types = Type.where(part_id: params[:part])
    respond_to do |format|
      format.js
    end
  end

  def show
    require 'nokogiri'

    @item = Item.find(params[:id])
    parser = Nokogiri::HTML(@item.body)

    @description = parser.css('section.description')
    @features = parser.css('section.features')
    @delivery = parser.css('section.delivery')
    @options = parser.css('section.options')
    @thead = parser.xpath('//table/thead')
    @tbody = parser.xpath('//table/tbody')
    @metatitle = @item.metatitle.to_s != '' ? @item.metatitle : @item.type.title + " | " + @item.title
    @keywords = @item.keywords
  end

  def new
    @item =Item.new
  end

  def create
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
    @part = @item.type.part
    @parts = @item.type.part.roottype.parts
    @types = @item.type.part.types
  end

  def update
    @item = Item.find(params[:id])
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
      @type = Type.where("thumb_item_id = ?", @item.id).first
      if @type != nil
        @type.update_attributes(:thumb_item_id => nil)
      end
      flash[:success] = "Материал снят с публикации"
    else
      @item.update_attributes(:public => true)
      flash[:success] = "Материал опубликован"
    end
    redirect_to item_url(@item.id)
  end


  def dublicate
    @item = Item.find(params[:id])
    if Item.create(:public => @item.public, :body => @item.body, :title => @item.title, :type_id => @item.type_id)
      flash[:success] = "Материал дублирован"
      redirect_to type_url(Type.find(@item.type_id))
    end
  end

  def destroy_asset
    @item = Item.find(params[:item_id])
    @asset = @item.attached_assets.find(params[:asset_id])
    @asset.destroy
    flash[:success] = "Изображение удалено"
    redirect_to edit_item_path(@item)
  end

  def up_order
    item = Item.find(params[:id])

    upper_item = Item.where(order: item.order-1, type_id: item.type_id).first
    upper_item.update_attributes(order: upper_item.order+1)
    item.update_attributes(order: item.order-1)

    render 'parts/index'
  end

  def down_order
    item = Item.find(params[:id])

    downer_item = Item.where(order: item.order+1, type_id: item.type_id).first
    downer_item.update_attributes(order: downer_item.order-1)
    item.update_attributes(order: item.order+1)

    render 'parts/index'
  end

  private
  def items_params
    params.require(:item).permit(:public, :body, :title, :type_id, :metatitle, :keywords, attached_assets_attributes: [:asset, :asset_file_name])
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
