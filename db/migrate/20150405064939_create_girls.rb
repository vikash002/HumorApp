class CreateGirls < ActiveRecord::Migration
  def change
    create_table :girls do |t|
      t.string :title
      t.string :url

      t.timestamps
    end
  end
end
