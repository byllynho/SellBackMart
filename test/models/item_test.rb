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

require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
