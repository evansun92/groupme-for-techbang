class Group < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: :user_id
  has_many :posts
  has_many :group_users
  has_many :members, through: :group_users, source: :user
  validates_presence_of :title

  after_create :join_owner_to_group

  def editable_by?(user)
    user && user == owner
  end

  def join_owner_to_group
    members << owner
  end
end
