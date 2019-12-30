class CreateEvaluatetags < ActiveRecord::Migration[6.0]
  def change
    create_table :evaluatetags do |t|
      t.bigint :user_id
      t.bigint :evaluatetagdef_id
      t.integer :rate

      t.timestamps
    end
  end
end
