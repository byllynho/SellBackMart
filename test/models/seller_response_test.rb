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
  # test "the truth" do
  #   assert true
  # end
end
