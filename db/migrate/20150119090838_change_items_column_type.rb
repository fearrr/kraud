class ChangeItemsColumnType < ActiveRecord::Migration
  def change
    remove_column :items, :type
    add_column :items, :type_id, :integer
  end
end
