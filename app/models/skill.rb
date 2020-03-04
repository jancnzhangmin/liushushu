class Skill < ApplicationRecord
  belongs_to :skillcla
  has_and_belongs_to_many :users
  has_many :tasks
  has_attached_file :skillimg, :url => "/:attachment/:id/:basename.:extension",  :path => ":rails_root/public/:attachment/:id/:basename.:extension"
  do_not_validate_attachment_file_type :skillimg
end
