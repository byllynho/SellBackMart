# == Schema Information
#
# Table name: watchlists
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
# Indexes
#
#  index_watchlists_on_user_id  (user_id)
#

class Watchlist < ApplicationRecord
  belongs_to :user,
        class_name: 'User', 
        foreign_key: 'user_id', 
        inverse_of: :watchlist,
        optional: true


  has_many :items, 
        class_name: 'WatchItem', 
        foreign_key: 'watchlist_id', 
        inverse_of: :watchlist,
        dependent: :destroy
end
