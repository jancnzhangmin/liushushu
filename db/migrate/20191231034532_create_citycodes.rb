class CreateCitycodes < ActiveRecord::Migration[6.0]
  def change
    create_table :citycodes do |t|
      t.string :citycode
      t.string :adcode
      t.string :name
      t.decimal :lng, precision:15, scale: 12
      t.decimal :lat, precision:15, scale: 12
      t.string :pinyin
      t.string :fullpinyin

      t.timestamps
    end
  end
end
