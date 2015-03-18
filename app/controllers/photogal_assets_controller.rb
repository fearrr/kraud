class PhotogalAssetsController < ApplicationController
  def create
    Photogal_asset.create(params)
  end

  private

  def params
    params.require(:photogal_asset).permit(:asset, :asset_file_name)
  end
end
