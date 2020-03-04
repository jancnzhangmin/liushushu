class AddTokenToProgre < ActiveRecord::Migration[6.0]
  def change
    add_column :progres, :token, :string
  end
end
