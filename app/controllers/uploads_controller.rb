class UploadsController < ApplicationController
  before_action :logged_in_admin
  def index
    @uploads = Upload.all
  end

  def new
    @upload = Upload.new()
  end
  def create
    @upload = Upload.new(upload_params)
    if @upload.save
      # Handle a successful save.
      flash[:success] = "Файл добавлен"
      redirect_to abouts_url
    else
      flash[:danger] = "Введите имя файла"
      redirect_to abouts_url
    end
  end
  def destroy
    @upload = Upload.find(params[:id])
    @upload.destroy
    flash[:success] = "Файл удален"
    redirect_to abouts_url
  end
  private
  def upload_params
    params.require(:upload).permit(:name, :asset)
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
