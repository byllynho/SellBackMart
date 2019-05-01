class MessagesController < ApplicationController
    layout 'standard'
    before_action :authenticate_user!

    def send_message
        @message = Message.new(params.require(:message).permit(:sender_id, :recipient_id, :read, :content))
        if @message.save!
            @user = User.find(@message.sender_id)
            redirect_to user_url(@user), notice: 'Your message has been sent'
        else
            flash.now[:alert] = 'Error! Unable to send message'
            render :new
        end
    end

    def check_messages
        messages = Message.where('recipient_id = ? AND read = ?', current_user.id, false)
        @read = '0'
        if !messages.empty?
            @read = '1'
        end
        respond_to do |format|
            format.json { render json: @read, status: :created, location: @read }
            format.js { render :nothing => true }
        end
        
    end
        
    def send_messages_ajax
        @message = Message.new(params.require(:message).permit(:sender_id, :recipient_id, :read, :content))

        respond_to do |format|
            if @message.save
                if @message.recipient.message_notifications
                    NotificationMailer.with(sender: @message.sender, recipient: @message.recipient).message_email.deliver_now
                end
                format.html { redirect_to @message, notice: 'Comment was successfully created.' }
                format.js   { }
                format.json { render json: 'Sent!', status: :created, location: @message }
            else
                format.html { render :new }
                #@message.errors
                format.json { render json: 'Ops! Message was not sent.', status: :unprocessable_entity }
            end
        end

    end

    def index
        @users = Message.where(sender_id: current_user.id).or(Message.where(recipient_id: current_user.id)).group(:recipient_id).group(:sender_id)
        @message = Message.new
    end

    def get_messages_from_user
        user_to = User.find(params[:user_to])
        @messages = Message.where("sender_id = ? AND recipient_id = ?", current_user.id, user_to.id).or(Message.where("sender_id = ? AND recipient_id = ?", user_to.id, current_user.id)).order("created_at ASC")
        #@messages = Message.all
        messages_unread = Message.where("sender_id = ? AND recipient_id = ? and read = ?", current_user.id, user_to.id, false).or(Message.where("sender_id = ? AND recipient_id = ? and read = ?", user_to.id, current_user.id, false))
        if !messages_unread.empty?
            messages_unread.each do |message|
                message.read = true
                message.save!
            end 
        end 
        respond_to do |format|
            format.html
            format.json { render json: @messages }
            format.js 
        end
    end

    def index
        @users = Message.where(sender_id: current_user.id).or(Message.where(recipient_id: current_user.id)).group(:recipient_id).group(:sender_id)
        @message = Message.new
        messages_unread = Message.where("recipient_id = ? AND read = ?", current_user.id, false).group(:recipient_id).group(:sender_id)
        @users_unread = []
        @users.each do |message|
            if message.read == false
                @users_unread << message.sender_id
            end
        end  
    end

end
