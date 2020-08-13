class Servicearea < ApplicationRecord
  acts_as_mappable
  belongs_to :user
end
