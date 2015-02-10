class CreateMains < ActiveRecord::Migration
  def change
    create_table :mains do |t|
      t.text :seo
      t.text :advantages

      t.timestamps
    end
  end
end
