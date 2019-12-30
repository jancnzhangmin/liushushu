class CreateProgreimgs < ActiveRecord::Migration[6.0]
  def change
    create_table :progreimgs do |t|
      t.bigint :progre_id

      t.timestamps
    end
  end
end
