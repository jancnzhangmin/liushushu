class CreateDescribeimgs < ActiveRecord::Migration[6.0]
  def change
    create_table :describeimgs do |t|
      t.bigint :user_id

      t.timestamps
    end
  end
end
