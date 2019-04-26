# == Schema Information
#
# Table name: reviews
#
#  id          :integer          not null, primary key
#  description :string
#  owner       :string
#  product     :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  item_id     :integer
#  user_id     :integer
#
# Indexes
#
#  index_reviews_on_item_id  (item_id)
#  index_reviews_on_user_id  (user_id)
#

class Review < ApplicationRecord
    belongs_to :seller, 
        class_name: 'User', 
        foreign_key: 'user_id', 
        inverse_of: :reviews,
        optional: true

    belongs_to :item,
        class_name: 'Item',
        foreign_key: 'item_id',
        inverse_of: :review,
        optional:true
end
