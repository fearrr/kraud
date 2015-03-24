class AddThumbItemIdToType < ActiveRecord::Migration
  def change
    add_column :types, :thumb_item_id, :integer
  end
end
