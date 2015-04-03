class TypesController < ApplicationController
# encoding: UTF-8
  before_action :logged_in_admin, only: [:edit, :update, :new]

  def destroy
    @type = Type.find(params[:id])
    @type.destroy
    flash[:success] = "Подраздел удален"
    redirect_to parts_url
  end

  def update_parts
    @parts = Roottype.find(params[:roottype]).parts
    respond_to do |format|
      format.js
    end
  end

  def edit
    @type = Type.find(params[:id])
    @part = @type.part
    @parts = @part.roottype.parts
    @items = Item.where("type_id = ? AND public = ?", @type.id, true)
  end

  def update
    @type = Type.find(params[:id])
    if @type.update_attributes(types_params)
      # Handle a successful update.
      flash[:success] = "Раздел обновлен"
      redirect_to type_url(@type.id)
    else
      render 'edit'
    end
  end

  def show
    @type = Type.find(params[:id])
    @thumb_item = Item.find(@type.thumb_item_id) if @type.thumb_item_id
    @counter = @type.items.where("public = ?", true).count

    if logged_in? == false
      if @counter > 0
        @items = @type.items.where("public = ?", true)
      else
        logged_in_admin
      end
    else
      @items = @type.items.all
    end
  end

  def new
    @type = Type.new
  end

  def create
    @type = Type.new(types_params)
    if @type.save
      # Handle a successful save.
      flash[:success] = "Подраздел добавлен"
      redirect_to type_url(@type.id)
    else
      render 'new'
    end
  end
end

def index
end

private
def types_params
  params.require(:type).permit(:title, :part_id, :thumb_item_id)
end

# Confirms a logged-in user.
def logged_in_admin
  unless logged_in?
    store_location
    flash[:danger] = "Зайдите как администратор"
    redirect_to login_url
  end
end
