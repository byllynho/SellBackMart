class UserNotificationMailer < ApplicationMailer
    # default from: 'SellBackMart@gmail.com'
    #layout "mailer"
    def match_update(match)
        @match = match
        #@url  = 'http://example.com/login'
        mail(to: @match.email, subject: 'A new item in your watch list has been posted!')
    end

end
