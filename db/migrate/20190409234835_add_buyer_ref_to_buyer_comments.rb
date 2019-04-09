class AddBuyerRefToBuyerComments < ActiveRecord::Migration[5.2]
  def change
    add_reference :buyer_comments, :user, foreign_key: true
  end
end
