class AddSkillidToTask < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :skill_id, :bigint
  end
end
