class MakeDefaultValuesForNotifications < ActiveRecord::Migration[5.2]
  def change
    change_column_default :users, :comment_notifications, from: nil, to: true
    change_column_default :users, :response_notifications, from: nil, to: true
    change_column_default :users, :message_notifications, from: nil, to: true
    change_column_default :users, :watchlist_notifications, from: nil, to: true
  end
end
