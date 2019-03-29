class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :title, null: false
      t.float :price, null: false
      t.string :image
      t.integer :condition, null: false, default: 0
      t.boolean :inactive, default: false
      t.text :description, null: false

      t.timestamps
    end
  
  add_reference :items, :user, index: true
  add_reference :items, :category, index: true
  end
end
