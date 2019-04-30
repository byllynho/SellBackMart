# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  deleted_at             :datetime
#  department             :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  major                  :string
#  name                   :string           not null
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
         :recoverable, :validatable, :confirmable
         
    has_many :items, 
        class_name: 'Item', 
        foreign_key: 'user_id', 
        inverse_of: :seller,
        dependent: :destroy

    has_many :comments, 
        class_name: 'BuyerComment', 
        foreign_key: 'user_id', 
        inverse_of: :buyer,
        dependent: :destroy
    
    has_many :deals, 
        class_name: 'Transaction', 
        foreign_key: 'user_id', 
        inverse_of: :buyer,
        dependent: :destroy
    
    has_one :watchlist, 
        class_name: 'Watchlist', 
        foreign_key: 'user_id', 
        inverse_of: :user,
        dependent: :destroy

    has_many :sent_messages, :class_name => 'Message', :foreign_key => 'sender_id'
    has_many :received_messages, :class_name => 'Message', :foreign_key => 'recipient_id'

    validates :name,  presence: true, length: { maximum: 50 }
    validates :email, presence: true, length: { maximum: 255 }
    validate :password_complexity

    def password_complexity
        # Regexp extracted from https://stackoverflow.com/questions/19605150/regex-for-password-must-contain-at-least-eight-characters-at-least-one-number-a
        return if password.blank? || password =~ /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$/
    
        errors.add :password, 'Complexity requirement not met. Please use: at least 1 uppercase, 1 lowercase, 1 digit and 1 special character.'
    end

    def self.current
        Thread.current[:user]
    end

    def self.current=(user)
        Thread.current[:user] = user
    end

    # instead of deleting, indicate the user requested a delete & timestamp it  
    def soft_delete  
        update_attribute(:deleted_at, Time.current)  
    end  
  
    # ensure user account is active  
    def active_for_authentication?  
        super && !deleted_at  
    end  
  
    # provide a custom message for a deleted account   
    def inactive_message   
  	    !deleted_at ? super : :deleted_account  
    end  

end
