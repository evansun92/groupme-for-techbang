class Group < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: :user_id
  has_many :posts

  validates_presence_of :title

  def editable_by?(user)
    user && user == owner
  end
end
