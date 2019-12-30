class CreateProgres < ActiveRecord::Migration[6.0]
  def change
    create_table :progres do |t|
      t.bigint :task_id
      t.text :summary
      t.integer :status

      t.timestamps
    end
  end
end
