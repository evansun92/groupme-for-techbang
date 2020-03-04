class Group < ApplicationRecord
  has_many :posts
  validates_presence_of :title
end
