class CreateRoottypes < ActiveRecord::Migration
  def change
    create_table :roottypes do |t|
      t.string :title
      t.timestamps
    end
  end
end
