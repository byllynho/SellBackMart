class UserNotificationMailer < ApplicationMailer
    # default from: 'SellBackMart@gmail.com'
    #layout "mailer"
    def item_update(item)
        #@url  = 'http://example.com/login'
        mail(to: 'ysun3@memphis.edu', subject: 'Welcome to My Awesome Site')
    end

end
