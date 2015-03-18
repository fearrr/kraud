class PhotogalsController < ApplicationController
  before_action :logged_in_admin, only: [:edit, :update, :new, :destroy_asset]

  def index
    @photogals = Photogal.all
  end
  def new
    @photogal = Photogal.new
  end

  def create
    @photogal = Photogal.new(photogal_params)
    if @photogal.save
      # Handle a successful save.
      flash[:success] = "Изображения добавлены"
      redirect_to photogals_url
    else
      render 'new'
    end
  end

  def destroy_asset
    @photogal = Photogal.find(params[:photogal_id])
    @asset = @photogal.photogal_assets.find(params[:asset_id])

    @asset.destroy
    @photogal.destroy if @photogal.photogal_assets.all.length == 0
    flash[:success] = "Изображение удалено"
    redirect_to photogals_url
  end

  private
  def photogal_params
    params.require(:photogal).permit(photogal_assets_attributes: [:asset, :asset_file_name])
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
