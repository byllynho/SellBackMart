class AddCommentRefToSellerResponses < ActiveRecord::Migration[5.2]
  def change
    add_reference :seller_responses, :buyer_comment, foreign_key: true
  end
end
