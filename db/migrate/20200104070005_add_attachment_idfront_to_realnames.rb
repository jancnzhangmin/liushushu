class AddAttachmentIdfrontToRealnames < ActiveRecord::Migration[6.0]
  def self.up
    change_table :realnames do |t|
      t.attachment :idfront
    end
  end

  def self.down
    remove_attachment :realnames, :idfront
  end
end
