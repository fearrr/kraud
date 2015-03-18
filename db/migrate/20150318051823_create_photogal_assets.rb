class CreatePhotogalAssets < ActiveRecord::Migration
  def change
    create_table :photogal_assets do |t|
      t.attachment :asset
      t.integer :attachable_id
      t.integer :attachable_type

      t.timestamps
    end
  end
end
