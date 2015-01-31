class ChangeTitleTypeInSliders < ActiveRecord::Migration
  def change
    remove_column :sliders, :title
    add_column :sliders, :title, :text
  end
end
