class ItemObserver < ActiveRecord::Observer
    def after_create(item)
     
        UserNotificationMailer.item_update(item).deliver if item.title == 'kitty'
        #UserNotificationMailer.account_activated_email(item).deliver if item.status == 'active'
        #UserNotificationMailer.account_deactivation_email(item).deliver if item.status =='deactive'
      
    end
  end