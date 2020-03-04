class CreateRealnames < ActiveRecord::Migration[6.0]
  def change
    create_table :realnames do |t|
      t.bigint :user_id
      t.string :name
      t.string :phone
      t.integer :status

      t.timestamps
    end
  end
end
