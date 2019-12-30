class User < ApplicationRecord
  has_many :tasks
  has_many :offers
  has_many :evaluatetags
  has_and_belongs_to_many :skills
end
