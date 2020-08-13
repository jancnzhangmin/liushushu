class User < ApplicationRecord
  acts_as_mappable
  has_many :tasks
  has_many :offers
  has_many :evaluatetags
  has_and_belongs_to_many :skills
  has_one :servicearea
  has_one :realname
  has_one :describe
  has_many :describeimgs

  after_create do
    self.create_servicearea()
    self.token = Digest::SHA1.hexdigest(self.id.to_s + Time.now.to_s)
    self.save
  end
end
