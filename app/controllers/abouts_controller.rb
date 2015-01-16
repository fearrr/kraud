class AboutsController < ApplicationController
  def index
    @body = About.find(1)
  end
  def edit
    @body = About.find(params[:id])
  end
  def update
    @body = About.find(params[:id])
    if @body.update_attributes(about_params)
      # Handle a successful update.
      flash[:success] = "Страница 'О компании' обновлена"
      redirect_to abouts_url
    else
      render 'edit'
    end
  end

  private
  def about_params
    params.require(:about).permit(:body)
  end
end