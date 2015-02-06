class GlobalsController < ApplicationController
  before_action :logged_in_admin
  def index
    @globals = Global.all.first
  end

  def edit
    @global = Global.find(params[:id])
  end

  def update
    @global = Global.find(params[:id])
    if @global.update_attributes(globals_params)
      # Handle a successful update.
      flash[:success] = "Глобальные параметры обновлены"
      redirect_to globals_path
    else
      render 'edit'
    end
  end

  private
  def globals_params
    params.require(:global).permit(:workStart, :workEnd, :address, :phone, :email)
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
