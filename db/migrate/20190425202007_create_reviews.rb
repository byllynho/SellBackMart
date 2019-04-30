class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :product
      t.string :description
      t.string :owner

      t.timestamps
    end
  end
end
