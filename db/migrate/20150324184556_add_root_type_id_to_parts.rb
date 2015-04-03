class AddRootTypeIdToParts < ActiveRecord::Migration
  def change
    add_column :parts, :root_type_id, :integer
  end
end
