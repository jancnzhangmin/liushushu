class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :nickname
      t.string :openid
      t.string :unionid
      t.string :token
      t.integer :realnamestatus
      t.integer :isartisan
      t.decimal :lng, precision:15, scale: 12
      t.decimal :lat, precision:15, scale: 12

      t.timestamps
    end
  end
end
