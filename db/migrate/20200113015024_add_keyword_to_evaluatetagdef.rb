class AddKeywordToEvaluatetagdef < ActiveRecord::Migration[6.0]
  def change
    add_column :evaluatetagdefs, :keyword, :string
  end
end
