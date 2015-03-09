class Upload < ActiveRecord::Base
  has_attached_file :asset
  do_not_validate_attachment_file_type :asset

  validates :name, presence: true, length: { maximum: 50 }
end
