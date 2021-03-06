# == Schema Information
#
# Table name: transactions
#
#  id         :integer          not null, primary key
#  review     :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  item_id    :integer
#  user_id    :integer
#
# Indexes
#
#  index_transactions_on_item_id  (item_id)
#  index_transactions_on_user_id  (user_id)
#

class Transaction < ApplicationRecord
    belongs_to :buyer, 
        class_name: 'User', 
        foreign_key: 'user_id', 
        inverse_of: :deals,
        optional: false
    
    belongs_to :item, 
        class_name: 'Item', 
        foreign_key: 'item_id', 
        inverse_of: :settlement,
        optional: false
end
