class PhotogalAssetsController < ApplicationController
  def create
    PhotogalAsset.create(photogal_asset_params)
  end

  def edit
    @asset = PhotogalAsset.find(params[:id]) # but if use only 1 or 2 it's work
  end

  def update
    asset = PhotogalAsset.find(params[:id])
    asset.update_attributes(asset_file_name: params[:asset_file_name])
    redirect_to photogals_url
  end

  private

  def photogal_asset_params
    params.require(:photogal_asset).permit(:asset, :asset_file_name)
  end
end
