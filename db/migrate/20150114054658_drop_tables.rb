class DropTables < ActiveRecord::Migration
  def change
    drop_table :actions
    drop_table :tidings
  end
end
