# == Schema Information
#
# Table name: items
#
#  id                 :integer          not null, primary key
#  condition          :integer          default(0), not null
#  description        :text             not null
#  image              :string
#  image_content_type :string
#  image_file_name    :string
#  image_file_size    :bigint
#  image_updated_at   :datetime
#  inactive           :boolean          default(FALSE)
#  photo_content_type :string
#  photo_file_name    :string
#  photo_file_size    :bigint
#  photo_updated_at   :datetime
#  price              :float            not null
#  title              :string           not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  category_id        :integer
#  user_id            :integer
#
# Indexes
#
#  index_items_on_category_id  (category_id)
#  index_items_on_user_id      (user_id)
#

class Item < ApplicationRecord
    has_attached_file :photo, styles: {large: "600x600>", medium: "300x300>", thumb: "150x150#"}
    validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
    has_one :transactions, 
        class_name: 'Transaction', 
        foreign_key: 'item_id', 
        inverse_of: :item,
        dependent: :destroy

    belongs_to :seller, 
        class_name: 'User', 
        foreign_key: 'user_id', 
        inverse_of: :items,
        optional: false

end
