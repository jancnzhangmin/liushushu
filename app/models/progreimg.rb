class Progreimg < ApplicationRecord
  belongs_to :progre
  has_attached_file :progreimg, :url => "/:attachment/:id/:basename.:extension",  :path => ":rails_root/public/:attachment/:id/:basename.:extension"
  do_not_validate_attachment_file_type :progreimg
end
