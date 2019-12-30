class CreateMytests < ActiveRecord::Migration[6.0]
  def change
    create_table :mytests do |t|
      t.string :name
      t.integer :age

      t.timestamps
    end
  end
end
