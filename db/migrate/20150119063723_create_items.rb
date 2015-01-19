class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :section
      t.string :type
      t.text :body

      t.timestamps
    end
  end
end
