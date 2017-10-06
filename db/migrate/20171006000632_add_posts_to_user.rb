class AddPostsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :posts, :string
  end
end
