class AttachedAssetsController < ApplicationController
  def create
    Attached_asset.create(params)
  end

  private

  def params
    params.require(:attached_asset).permit(:asset, :asset_file_name)
  end
end
