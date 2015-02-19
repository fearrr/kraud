class AddAttachmentImageToTidings < ActiveRecord::Migration
  def self.up
    change_table :tidings do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :tidings, :image
  end
end
