class CreateGlobals < ActiveRecord::Migration
  def change
    create_table :globals do |t|
      t.text :address
      t.string :phone
      t.string :email
      t.integer :workStart
      t.integer :workEnd

      t.timestamps
    end
  end
end
