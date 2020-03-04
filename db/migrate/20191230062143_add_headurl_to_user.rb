class AddHeadurlToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :headurl, :string
  end
end
