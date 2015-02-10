class MainsController < ApplicationController
  def index
    @main = Main.find(params[:id])
  end

  def edit
    @main = Main.find(params[:id])
  end

  def update
    @main = Main.find(params[:id])
    if @main.update_attributes(main_params)
      # Handle a successful update.
      flash[:success] = "Страница изменена"
      redirect_to root_url
    else
      render 'edit'
    end
  end

  private
  def main_params
    params.require(:main).permit(:seotitle, :seo, :advantages)
  end
end
