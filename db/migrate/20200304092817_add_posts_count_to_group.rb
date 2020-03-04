class AddPostsCountToGroup < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :posts_count, :integer, default: 0
  end
end
