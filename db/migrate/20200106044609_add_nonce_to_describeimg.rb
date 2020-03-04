class AddNonceToDescribeimg < ActiveRecord::Migration[6.0]
  def change
    add_column :describeimgs, :nonce, :string
  end
end
