class AddAttachmentImageToActions < ActiveRecord::Migration
  def self.up
    change_table :actions do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :actions, :image
  end
end
