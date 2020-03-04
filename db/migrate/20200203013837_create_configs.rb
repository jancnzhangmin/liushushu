class CreateConfigs < ActiveRecord::Migration[6.0]
  def change
    create_table :configs do |t|
      t.string :appid
      t.string :appsecret

      t.timestamps
    end
  end
end
