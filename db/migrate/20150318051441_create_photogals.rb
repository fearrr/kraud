class CreatePhotogals < ActiveRecord::Migration
  def change
    create_table :photogals do |t|

      t.timestamps
    end
  end
end
