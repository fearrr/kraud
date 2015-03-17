class Uploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.text :name

      t.timestamps
    end
  end
end
