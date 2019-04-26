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

require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
