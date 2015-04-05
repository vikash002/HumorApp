class AddUserIdToCutes < ActiveRecord::Migration
  def change
    add_column :cutes, :user_id, :integer
    add_index :cutes, :user_id
  end
end
