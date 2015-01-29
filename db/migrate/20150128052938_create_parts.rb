class CreateParts < ActiveRecord::Migration
  def change
    create_table :parts do |t|
      t.string :section
      t.string :title

      t.timestamps
    end
  end
end
