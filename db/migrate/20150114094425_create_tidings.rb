class CreateTidings < ActiveRecord::Migration
  def change
    create_table :tidings do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
