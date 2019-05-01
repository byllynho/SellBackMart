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

class WatchItem < ApplicationRecord
  belongs_to :watchlist,
        class_name: 'Watchlist', 
        foreign_key: 'watchlist_id', 
        inverse_of: :items,
        optional: true
end
