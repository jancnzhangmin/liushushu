class Progre < ApplicationRecord
  belongs_to :task
  has_many :progreimgs
end
