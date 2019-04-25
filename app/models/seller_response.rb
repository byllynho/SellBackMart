# == Schema Information
#
# Table name: seller_responses
#
#  id               :integer          not null, primary key
#  response_text    :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  buyer_comment_id :integer
#
# Indexes
#
#  index_seller_responses_on_buyer_comment_id  (buyer_comment_id)
#

class SellerResponse < ApplicationRecord
    validates :response_text, length: {minimum: 1, maximum: 500 }
    
    belongs_to :comment, 
        class_name: 'BuyerComment', 
        foreign_key: 'buyer_comment_id', 
        inverse_of: :responses,
        optional: false
end
