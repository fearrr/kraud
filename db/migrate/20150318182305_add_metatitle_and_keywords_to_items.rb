class AddMetatitleAndKeywordsToItems < ActiveRecord::Migration
  def change
    add_column :items, :metatitle, :string
    add_column :items, :keywords, :text
  end
end
