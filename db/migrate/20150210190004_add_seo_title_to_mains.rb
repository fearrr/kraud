class AddSeoTitleToMains < ActiveRecord::Migration
  def change
    add_column :mains, :seotitle, :string
  end
end
