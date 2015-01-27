class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :name
      t.string :email
      t.string :remember_digest
      t.string :password_digest

      t.timestamps
    end
    add_index :admins, :email, unique: true
  end
end
