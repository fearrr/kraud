class AddOrderToTables < ActiveRecord::Migration
  def change
    add_column :roottypes, :order, :integer
    add_column :parts, :order, :integer
    add_column :types, :order, :integer
    add_column :items, :order, :integer
  end
end
