class RenameRootTypeIdColumnOnParts < ActiveRecord::Migration
  def change
    change_table :parts do |t|
      t.rename :root_type_id, :roottype_id
    end
  end
end
