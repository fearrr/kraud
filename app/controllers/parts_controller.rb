class PartsController < ApplicationController
  # encoding: UTF-8
  before_action :logged_in_admin, only: [:edit, :update, :new, :order, :up_order, :down_order]

  def edit
    @part = Part.find(params[:id])
  end

  def update
    @part = Part.find(params[:id])
    if @part.update_attributes(parts_params)
      # Handle a successful update.
      flash[:success] = "Раздел обновлен"
      redirect_to parts_url
    else
      render 'edit'
    end
  end

  def destroy
    @part = Part.find(params[:id])
    @part.destroy
    flash[:success] = "Раздел удален"
    redirect_to parts_url
  end

  def index
    @roottypes = Roottype.all
  end

  def show
    @roottypes = Roottype.all

    @part = Part.find(params[:id])
    @roottype = @part.roottype

    @counter = 0
    @part.types.each do |type|
      @counter += type.items.where("public = ?", true).count
    end
    if logged_in? == false
      if @counter > 0
        @types = @part.types.all
      else
        logged_in_admin
      end
    else
      @types = @part.types.all
    end
  end

  def new
    @part = Part.new
  end

  def create
    @part = Part.new(parts_params)
    if @part.save
      # Handle a successful save.
      flash[:success] = "Раздел добавлен"
      redirect_to parts_url
    else
      render 'new'
    end
  end

  def order
    @roottype = Roottype.find(params[:roottype_id])
    @parts = Part.where(roottype_id: params[:roottype_id])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def up_order
    part = Part.find(params[:id])

    upper_part = Part.where(order: part.order-1, roottype_id: part.roottype_id).first
    upper_part.update_attributes(order: upper_part.order+1)
    part.update_attributes(order: part.order-1)

    redirect_to parts_order_path(:roottype_id => part.roottype_id)
  end

  def down_order
    part = Part.find(params[:id])

    downer_part = Part.where(order: part.order+1, roottype_id: part.roottype_id).first
    downer_part.update_attributes(order: downer_part.order-1)
    part.update_attributes(order: part.order+1)

    redirect_to parts_order_path(:roottype_id => part.roottype_id)
  end

  private
  def parts_params
    params.require(:part).permit(:title, :roottype_id)
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
