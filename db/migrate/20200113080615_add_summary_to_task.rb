class AddSummaryToTask < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :summary, :text
  end
end
