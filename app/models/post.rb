class Post < ApplicationRecord
  belongs_to :group
  validates_presence_of :content
end
