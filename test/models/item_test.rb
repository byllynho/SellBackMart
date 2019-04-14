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
#  image_content_type  :string
#  image_file_name     :string
#  image_file_size     :integer
#  image_updated_at    :datetime
#  inactive            :boolean          default(FALSE)
#  photo_content_type  :string
#  photo_file_name     :string
#  photo_file_size     :integer
#  photo_updated_at    :datetime
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
#  index_items_on_buyer_comment_id  (buyer_comment_id)
#  index_items_on_category_id       (category_id)
#  index_items_on_user_id           (user_id)
#

require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
