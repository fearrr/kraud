class AboutsController < ApplicationController
  def index
    @body = About.find(1)
    @comments = Comment.where("public = ?", true).order('created_at DESC')
    @notPublic = Comment.where("public = ?", false).order('created_at DESC')
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
