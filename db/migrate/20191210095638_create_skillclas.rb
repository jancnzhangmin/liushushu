class CreateSkillclas < ActiveRecord::Migration[6.0]
  def change
    create_table :skillclas do |t|
      t.string :name

      t.timestamps
    end
  end
end
