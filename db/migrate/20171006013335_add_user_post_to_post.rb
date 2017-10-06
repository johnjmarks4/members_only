class AddUserPostToPost < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :user_posts, :string
    remove_column :posts, :post
  end
end
