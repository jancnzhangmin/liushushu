class ChangeColumnForProgreTokenNonce < ActiveRecord::Migration[6.0]
  def change
    rename_column :progres, :token, :nonce
  end
end
