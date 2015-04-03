class RoottypesController < ApplicationController

  before_action :logged_in_admin, only: [:index, :edit, :update, :new]

  def edit
    @roottype = Roottype.find(params[:id])
  end

  def new
    @roottype = Roottype.new
  end

  def create
    @roottype = Roottype.new(roottype_params)
    if @roottype.save
      # Handle a successful save.
      flash[:success] = "Категория добавлена"
      redirect_to roottypes_url
    else
      render 'new'
    end
  end

  def destroy
    @roottype = Roottype.find(params[:id])
    @roottype.destroy
    flash[:success] = "Категория удалена"
    redirect_to roottypes_url
  end

  def update
    @roottype = Roottype.find(params[:id])
    if @roottype.update_attributes(roottype_params)
      # Handle a successful update.
      flash[:success] = "Категория обновлена"
      redirect_to roottypes_url
    else
      render 'edit'
    end

  end

  def show
    @roottype = Roottype.find(params[:id])
  end

  def index
    @roottypes = Roottype.all
  end


  private
  def roottype_params
    params.require(:roottype).permit(:title)
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
