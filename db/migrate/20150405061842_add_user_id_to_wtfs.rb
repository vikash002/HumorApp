class AddUserIdToWtfs < ActiveRecord::Migration
  def change
    add_column :wtfs, :user_id, :integer
    add_index :wtfs, :user_id
  end
end
