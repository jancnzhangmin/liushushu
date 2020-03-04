class AddAttachmentIdbackToRealnames < ActiveRecord::Migration[6.0]
  def self.up
    change_table :realnames do |t|
      t.attachment :idback
    end
  end

  def self.down
    remove_attachment :realnames, :idback
  end
end
