class NotificationMailer < ApplicationMailer

    def comment_email
        @item = params[:item]
        @seller = params[:seller]
        @buyer = params[:buyer]
        mail(to: @seller.email, subject: @buyer.name + " commented on your item")
    end

    def message_email
        @sender = params[:sender]
        @recipient = params[:recipient]
        mail(to: @recipient.email, subject: @sender.name + " sent you a message")
    end

    def response_email
        @item = params[:item]
        @seller = params[:seller]
        @buyer = params[:buyer]
        mail(to: @buyer.email, subject: @seller.name + " responded to your comment")
    end


end
