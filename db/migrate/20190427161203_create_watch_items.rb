class CreateWatchItems < ActiveRecord::Migration[5.2]
  def change
    create_table :watch_items do |t|
      t.string :title
      t.integer :category
      t.references :watchlist, foreign_key: true

      t.timestamps
    end
  end
end
