class CreateOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers do |t|
      t.bigint :task_id
      t.bigint :user_id
      t.float :price
      t.text :summary

      t.timestamps
    end
  end
end
