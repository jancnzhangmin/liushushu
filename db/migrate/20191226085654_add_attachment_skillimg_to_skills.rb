class AddAttachmentSkillimgToSkills < ActiveRecord::Migration[6.0]
  def self.up
    change_table :skills do |t|
      t.attachment :skillimg
    end
  end

  def self.down
    remove_attachment :skills, :skillimg
  end
end
