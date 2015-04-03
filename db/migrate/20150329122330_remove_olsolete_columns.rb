class RemoveOlsoleteColumns < ActiveRecord::Migration
  def change
    change_table :types do |t|
      t.remove :section
    end

    change_table :items do |t|
      t.remove :section
      t.remove :part_id
    end
  end
end
