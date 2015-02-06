class AddIspublicForItems < ActiveRecord::Migration
  def change
    add_column :items, :isPublic, :boolean
  end
end
