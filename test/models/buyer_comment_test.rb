# == Schema Information
#
# Table name: buyer_comments
#
#  id           :integer          not null, primary key
#  comment_text :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  item_id      :integer
#
# Indexes
#
#  index_buyer_comments_on_item_id  (item_id)
#

require 'test_helper'

class BuyerCommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
