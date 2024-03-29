class SlidersController < ApplicationController
  before_action :logged_in_admin
  def index
    @sliders = Slider.all
  end

  def edit
    @slider = Slider.find(params[:id])
  end
  def update
    @slider = Slider.find(params[:id])
    if @slider.update_attributes(slider_params)
      # Handle a successful save.
      flash[:success] = "Изображение изменено"
      redirect_to sliders_url
    else
      render 'edit'
    end
  end

  def new
    @slider = Slider.new()
  end

  def create
    @slider = Slider.new(slider_params)
    if @slider.save
      # Handle a successful save.
      flash[:success] = "Изображение добавлено"
      redirect_to sliders_url
    else
      render 'new'
    end
  end

  def destroy
    @slider = Slider.find(params[:id])
    @slider.destroy
    flash[:success] = "Изображение удалено"
    redirect_to sliders_url
  end

  private
  def slider_params
    params.require(:slider).permit(:image, :title)
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
