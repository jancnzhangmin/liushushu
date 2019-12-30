class AddAttachmentProgreimgToProgreimgs < ActiveRecord::Migration[6.0]
  def self.up
    change_table :progreimgs do |t|
      t.attachment :progreimg
    end
  end

  def self.down
    remove_attachment :progreimgs, :progreimg
  end
end
