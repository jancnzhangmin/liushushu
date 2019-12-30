class Task < ApplicationRecord
  belongs_to :user
  has_many :progres
  has_many :offers
  has_many :evaluates
end
