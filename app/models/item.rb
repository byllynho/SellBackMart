# == Schema Information
#
# Table name: items
#
#  id          :integer          not null, primary key
#  condition   :integer          default(0), not null
#  description :text             not null
#  image       :string
#  inactive    :boolean          default(FALSE)
#  price       :float            not null
#  title       :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#  user_id     :integer
#
# Indexes
#
#  index_items_on_category_id  (category_id)
#  index_items_on_user_id      (user_id)
#

class Item < ApplicationRecord
    has_one :transactions, 
        class_name: 'Transactions', 
        foreign_key: 'item_id', 
        inverse_of: :item,
        dependent: :destroy

    belongs_to :user, 
        class_name: 'User', 
        foreign_key: 'user_id', 
        inverse_of: :items,
        optional: true

end
