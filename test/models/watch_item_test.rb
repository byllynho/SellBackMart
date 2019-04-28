# == Schema Information
#
# Table name: watch_items
#
#  id           :integer          not null, primary key
#  category     :integer
#  title        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  watchlist_id :integer
#
# Indexes
#
#  index_watch_items_on_watchlist_id  (watchlist_id)
#

require 'test_helper'

class WatchItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
