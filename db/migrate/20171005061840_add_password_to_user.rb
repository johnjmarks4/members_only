class AddPasswordToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :password, :string
    add_column :users, :password_confirmation, :string
    remove_column :users, :password_digest
  end
end
