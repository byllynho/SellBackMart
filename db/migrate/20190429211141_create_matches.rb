class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.string :title
      t.string :email

      t.timestamps
    end
  end
end
