class MatchObserver < ActiveRecord::Observer
    def after_create(match)
        UserNotificationMailer.match_update(match).deliver 
        #UserNotificationMailer.account_activated_email(item).deliver if item.status == 'active'
        #UserNotificationMailer.account_deactivation_email(item).deliver if item.status =='deactive'
      
    end

end