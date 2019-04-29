class NotificationMailer < ApplicationMailer

    def comment_email
        @item = params[:item]
        @seller = params[:seller]
        @buyer = params[:buyer]
        mail(to: @seller.email, subject: @buyer.name + " commented on your item")
    end

end
