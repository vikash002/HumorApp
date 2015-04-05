class CreateWtfs < ActiveRecord::Migration
  def change
    create_table :wtfs do |t|
      t.string :title
      t.string :url

      t.timestamps
    end
  end
end
