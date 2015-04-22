class AddTitleToPhotogalAssets < ActiveRecord::Migration
  def change
    add_column :photogal_assets, :title, :text
  end
end
