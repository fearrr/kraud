class AddColumnsToTidings < ActiveRecord::Migration
  def change
    add_column :tidings, :title, :string
    add_column :tidings, :body, :string

    add_column :actions, :title, :string
    add_column :actions, :body, :string
  end
end
