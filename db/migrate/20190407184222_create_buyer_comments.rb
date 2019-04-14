class CreateBuyerComments < ActiveRecord::Migration[5.2]
  def change
    create_table :buyer_comments do |t|
      t.text :comment_text

      t.timestamps
    end
  end
end
