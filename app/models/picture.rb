# == Schema Information
#
# Table name: pictures
#
#  id                 :integer          not null, primary key
#  image_content_type :string
#  image_file_name    :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  item_id            :integer
#
# Indexes
#
#  index_pictures_on_item_id  (item_id)
#

class Picture < ApplicationRecord
    belongs_to :item,
      class_name: 'Item',
      foreign_key: 'item_id',
      inverse_of: :pictures,
      optional: true

    has_attached_file :image,
      :path => ":rails_root/public/images/:id/:filename",
      :url  => "/images/:id/:filename"

    do_not_validate_attachment_file_type :image
end
