class Describeimg < ApplicationRecord
  belongs_to :user
  has_attached_file :describeimg, :url => "/:attachment/:id/:basename.:extension",  :path => ":rails_root/public/:attachment/:id/:basename.:extension"
  do_not_validate_attachment_file_type :describeimg
end
