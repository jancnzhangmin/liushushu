class AddKeywordToSkillcla < ActiveRecord::Migration[6.0]
  def change
    add_column :skillclas, :keyword, :string
  end
end
