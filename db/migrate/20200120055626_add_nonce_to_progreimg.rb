class AddNonceToProgreimg < ActiveRecord::Migration[6.0]
  def change
    add_column :progreimgs, :nonce, :string
  end
end
