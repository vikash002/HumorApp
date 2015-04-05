class AddUserIdToGirls < ActiveRecord::Migration
  def change
    add_column :girls, :user_id, :integer
    add_index :girls, :user_id
  end
end
