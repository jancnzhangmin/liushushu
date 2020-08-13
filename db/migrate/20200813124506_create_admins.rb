class CreateAdmins < ActiveRecord::Migration[6.0]
  def change
    create_table :admins do |t|
      t.string :nikname
      t.string :username
      t.string :password
      t.integer :isenable

      t.timestamps
    end
  end
end
