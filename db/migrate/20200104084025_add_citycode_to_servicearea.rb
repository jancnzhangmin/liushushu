class AddCitycodeToServicearea < ActiveRecord::Migration[6.0]
  def change
    add_column :serviceareas, :citycode, :string
  end
end
