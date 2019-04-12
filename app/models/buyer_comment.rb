# == Schema Information
#
# Table name: buyer_comments
#
#  id           :integer          not null, primary key
#  comment_text :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  item_id      :integer
#  user_id      :integer
#
# Indexes
#
#  index_buyer_comments_on_item_id  (item_id)
#  index_buyer_comments_on_user_id  (user_id)
#

class BuyerComment < ApplicationRecord
    belongs_to :item, 
        class_name: 'Item', 
        foreign_key: 'item_id', 
        inverse_of: :comments,
        optional: false

    belongs_to :buyer, 
        class_name: 'User', 
        foreign_key: 'user_id', 
        inverse_of: :comments,
        optional: false

    has_many :responses,
        class_name: 'SellerResponse',
        foreign_key: 'buyer_comment_id',
        inverse_of: :comment,
        dependent: :destroy
end
