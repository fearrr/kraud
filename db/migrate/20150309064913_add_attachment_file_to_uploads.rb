class AddAttachmentFileToUploads < ActiveRecord::Migration
  def self.up
    change_table :uploads do |t|
      t.attachment :asset
    end
  end

  def self.down
    remove_attachment :uploads, :asset
  end
end
