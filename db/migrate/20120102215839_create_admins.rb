class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :password_confimation

      t.timestamps
    end
  end
end
