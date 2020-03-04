class CreateDescribes < ActiveRecord::Migration[6.0]
  def change
    create_table :describes do |t|
      t.bigint :user_id
      t.text :content

      t.timestamps
    end
  end
end
