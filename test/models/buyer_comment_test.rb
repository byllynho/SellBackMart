# == Schema Information
#
# Table name: buyer_comments
#
#  id           :integer          not null, primary key
#  comment_text :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  item_id      :integer
#  user_id      :integer
#
# Indexes
#
#  index_buyer_comments_on_item_id  (item_id)
#  index_buyer_comments_on_user_id  (user_id)
#

require 'test_helper'

class BuyerCommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "Comments should be valid" do
    one = buyer_comments(:one)
    assert one.valid?
  end

  test "Comments should not be more than 500 characters" do
    one = buyer_comments(:one)
    one.comment_text = "0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789~onehundred0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789~twohundred0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789~threehundred0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789~fourhundred0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789~fivefundred"
    assert_not one.valid?
  end

  test "Comments should not be blank" do
    one = buyer_comments(:one)
    one.comment_text = ""
    assert_not one.valid?
  end

  test "Comment must belong to an item" do
    one = buyer_comments(:one)
    one.item_id = nil
    assert_not one.valid?
  end

  test "Comment must belong to a user" do
    one = buyer_comments(:one)
    one.user_id = nil
    assert_not one.valid?
  end


  end
