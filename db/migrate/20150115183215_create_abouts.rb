class CreateAbouts < ActiveRecord::Migration
  def change
    create_table :abouts do |t|
      t.text :body
      t.timestamps
    end
  end
end
