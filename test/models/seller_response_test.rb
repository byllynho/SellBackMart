# == Schema Information
#
# Table name: seller_responses
#
#  id               :integer          not null, primary key
#  response_text    :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  buyer_comment_id :integer
#
# Indexes
#
#  index_seller_responses_on_buyer_comment_id  (buyer_comment_id)
#

require 'test_helper'

class SellerResponseTest < ActiveSupport::TestCase
  test "Responses should be valid" do
    one = seller_responses(:one)
    assert one.valid?
  end

  test "Responses should not be more than 500 characters" do
    one = seller_responses(:one)
    one.response_text = "0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789~onehundred0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789~twohundred0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789~threehundred0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789~fourhundred0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789~fivefundred"
    assert_not one.valid?
  end

  test "Responses should not be blank" do
    one = seller_responses(:one)
    one.response_text = ""
    assert_not one.valid?
  end

  test "Response must belong to a comment" do
    one = seller_responses(:one)
    one.buyer_comment_id = nil
    assert_not one.valid?
  end

  
  
  
  # test "the truth" do
  #   assert true
  # end
end
