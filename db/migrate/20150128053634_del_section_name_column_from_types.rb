class DelSectionNameColumnFromTypes < ActiveRecord::Migration
  def change
    remove_column :types, :section_name
    add_column :types, :section, :string
    add_column :types, :part_id, :integer
  end
end
