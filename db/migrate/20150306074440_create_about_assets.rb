class CreateAboutAssets < ActiveRecord::Migration
  def change
    create_table :about_assets do |t|
      t.attachment :asset
      t.integer :attachable_id
      t.integer :attachable_type
    end
  end
end
