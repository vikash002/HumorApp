class AddUserIdToGkeeys < ActiveRecord::Migration
  def change
    add_column :gkeeys, :user_id, :integer
    add_index :gkeeys, :user_id
  end
end
