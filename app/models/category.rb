# == Schema Information
#
# Table name: categories
#
#  id          :integer          not null, primary key
#  description :string           not null
#

class Category < ApplicationRecord
    has_many :items, 
        class_name: 'Item', 
        foreign_key: 'category_id', 
        inverse_of: :category,
        dependent: :destroy

end
