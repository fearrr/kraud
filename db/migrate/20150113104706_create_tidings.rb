class CreateTidings < ActiveRecord::Migration
  def change
    create_table :tidings do |t|

      t.timestamps
    end
  end
end
