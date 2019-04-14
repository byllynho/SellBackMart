class AddItemRefToBuyerComments < ActiveRecord::Migration[5.2]
  def change
    add_reference :buyer_comments, :item, foreign_key: true
  end
end
