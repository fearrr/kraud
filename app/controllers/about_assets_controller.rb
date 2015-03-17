class AboutAssetsController < ApplicationController
  def create
    About_asset.create(params)
  end

  private

  def params
    params.require(:about_asset).permit(:asset, :asset_file_name)
  end
end
