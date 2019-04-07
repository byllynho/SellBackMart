# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  department      :string
#  email           :string           not null
#  major           :string
#  name            :string           not null
#  password        :string           not null
#  validated       :boolean          default(FALSE)
#  validation_code :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
    has_many :items, 
        class_name: 'Item', 
        foreign_key: 'user_id', 
        inverse_of: :user,
        dependent: :destroy
    
    has_many :transactions, 
        class_name: 'Transactions', 
        foreign_key: 'user_id', 
        inverse_of: :buyer,
        dependent: :destroy

    has_many :sent_messages, :class_name => 'Message', :foreign_key => 'sender_id'
    has_many :received_messages, :class_name => 'Message', :foreign_key => 'recipient_id'
end
