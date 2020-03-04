class AddSubmitacceptToTask < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :submitaccept, :integer
    add_column :tasks, :submitaccepttime, :datetime
  end
end
