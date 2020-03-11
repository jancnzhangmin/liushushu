class AddMsgToRealname < ActiveRecord::Migration[6.0]
  def change
    add_column :realnames, :msg, :string
  end
end
