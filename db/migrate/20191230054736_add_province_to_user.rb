class AddProvinceToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :province, :string
    add_column :users, :city, :string
    add_column :users, :district, :string
    add_column :users, :adcode, :string
  end
end
