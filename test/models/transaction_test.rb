# == Schema Information
#
# Table name: transactions
#
#  id         :integer          not null, primary key
#  review     :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  item_id    :integer
#  user_id    :integer
#
# Indexes
#
#  index_transactions_on_item_id  (item_id)
#  index_transactions_on_user_id  (user_id)
#

require 'test_helper'

class TransactionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
