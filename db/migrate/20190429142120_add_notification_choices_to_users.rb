class AddNotificationChoicesToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :comment_notifications, :boolean
    add_column :users, :response_notifications, :boolean
    add_column :users, :message_notifications, :boolean
    add_column :users, :watchlist_notifications, :boolean
  end
end
