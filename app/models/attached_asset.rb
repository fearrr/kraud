class AttachedAsset < ActiveRecord::Base
  belongs_to :attachable, :polymorphic => true
  has_attached_file :asset, :styles => { :mikro => "100x100#", :mini => "290x180>", :normal => "380x300>" }
  do_not_validate_attachment_file_type :asset
  # validates_attachment_content_type :file_name, :content_type => %w(image/jpeg image/jpg image/png)

end
w