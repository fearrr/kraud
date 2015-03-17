class IspublicToPublicInItems < ActiveRecord::Migration
  def change
    remove_column :items, :isPublic
    add_column :items, :public, :boolean
  end
end
