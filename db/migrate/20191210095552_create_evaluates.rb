class CreateEvaluates < ActiveRecord::Migration[6.0]
  def change
    create_table :evaluates do |t|
      t.bigint :task_id
      t.float :attiude
      t.float :ability
      t.float :speed

      t.timestamps
    end
  end
end
