class AddVcodeToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :vcode, :string
    add_column :users, :vcodetime, :datetime
  end
end
