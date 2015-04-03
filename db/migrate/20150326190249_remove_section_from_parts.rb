class RemoveSectionFromParts < ActiveRecord::Migration
  def change
    change_table :parts do |t|
      t.remove :section
    end
  end
end
