class CreateGkeeys < ActiveRecord::Migration
  def change
    create_table :gkeeys do |t|
      t.string :title
      t.string :url

      t.timestamps
    end
  end
end
