class AddRateaverageToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :rateaverage, :float
    add_column :users, :servicecount, :integer
  end
end
