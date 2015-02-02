class GlobalsController < ApplicationController
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
end
