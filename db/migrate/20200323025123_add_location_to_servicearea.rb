class AddLocationToServicearea < ActiveRecord::Migration[6.0]
  def change
    add_column :serviceareas, :location, :geometry
  end
end
