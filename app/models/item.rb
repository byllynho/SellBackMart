# == Schema Information
#
# Table name: items
#
#  id                  :integer          not null, primary key
#  avatar_content_type :string
#  avatar_file_name    :string
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#  condition           :integer          default(0), not null
#  description         :text             not null
#  image               :string
#  inactive            :boolean          default(FALSE)
#  price               :float            not null
#  title               :string           not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  category_id         :integer
#  user_id             :integer
#
# Indexes
#
#  index_items_on_category_id  (category_id)
#  index_items_on_user_id      (user_id)
#

class Item < ApplicationRecord
    validates :title, presence:true
    validates :price, presence:true
    validates :condition, presence:true, numericality: { less_than_or_equal_to: 10, 
      message: "Entered value should be between 0 and 10" }
    validates :category_id, presence:true
    validates :description, presence: true

    has_attached_file :avatar,  
      styles: { large: "600x600>", medium: "300x300>", thumb: "150x150#>"}, default_url: 'textbooks.png'
    validates_attachment_content_type :avatar, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]

    has_one :transactions, 
        class_name: 'Transactions', 
        foreign_key: 'item_id', 
        inverse_of: :transactions
        # dependent: :destroy

    belongs_to :user, 
        class_name: 'User', 
        foreign_key: 'user_id', 
        inverse_of: :items,
        optional: true
end
