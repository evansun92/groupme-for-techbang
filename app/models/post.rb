class Post < ApplicationRecord
  belongs_to :group, counter_cache: true
  validates_presence_of :content

  belongs_to :author, class_name: 'User', foreign_key: :user_id

  def editable_by?(user)
    user && user == author
  end
end
