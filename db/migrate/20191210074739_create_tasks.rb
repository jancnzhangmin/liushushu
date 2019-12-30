class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.bigint :user_id
      t.string :tasknumber
      t.integer :choiceartisanstatus
      t.datetime :choiceartisantime
      t.integer :beginstatus
      t.datetime :begintime
      t.integer :acceptstatus
      t.integer :qualstatus
      t.datetime :qualtime
      t.string :contact
      t.string :contactphone
      t.string :adcode
      t.string :province
      t.string :city
      t.string :district
      t.string :address

      t.timestamps
    end
  end
end
