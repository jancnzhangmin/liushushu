class CreateServiceareas < ActiveRecord::Migration[6.0]
  def change
    create_table :serviceareas do |t|
      t.bigint :user_id
      t.string :province
      t.string :city
      t.string :districe
      t.string :adcode
      t.decimal :lng, precision:15, scale: 12
      t.decimal :lat, precision:15, scale: 12

      t.timestamps
    end
  end
end
