class AboutsController < ApplicationController
  before_action :logged_in_admin, only: [:edit, :update, :new]

  def index
    require 'nokogiri'
    @body = About.find(1)
    @comments = Comment.where("public = ?", true).order('created_at DESC')
    @notPublic = Comment.where("public = ? OR public = ?", nil, false).length
    @item = Item.first

    parser = Nokogiri::HTML(@body.body)
    @firstSection = parser.css('section.first')
    @secondSection = parser.css('section.second')
    @thirdSection = parser.css('section.third')

    @upload = Upload.new()
    @uploads = Upload.all
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
  def destroy_asset
    @body = About.find(1)
    @asset = @body.about_assets.find(params[:asset_id])
    @asset.destroy
    flash[:success] = "Изображение удалено"
    redirect_to edit_about_path(@body)
  end

  private
  def about_params
    params.require(:about).permit(:body, about_assets_attributes: [:asset, :asset_file_name])
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
