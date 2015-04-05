class AddUserIdToMemes < ActiveRecord::Migration
  def change
    add_column :memes, :user_id, :integer
    add_index :memes, :user_id
  end
end
