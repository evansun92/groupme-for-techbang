class Post < ApplicationRecord
  belongs_to :group
  validates_presence_of :content

  belongs_to :author, class_name: 'User', foreign_key: :user_id

  def editable_by?(user)
    user && user == author
  end
end
