class CreateTypes < ActiveRecord::Migration
  def change
    create_table :types do |t|
      t.string :title
      t.string :section_name

      t.timestamps
    end
  end
end
