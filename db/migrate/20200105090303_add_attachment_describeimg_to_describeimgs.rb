class AddAttachmentDescribeimgToDescribeimgs < ActiveRecord::Migration[6.0]
  def self.up
    change_table :describeimgs do |t|
      t.attachment :describeimg
    end
  end

  def self.down
    remove_attachment :describeimgs, :describeimg
  end
end
