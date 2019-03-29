# == Schema Information
#
# Table name: messages
#
#  id           :integer          not null, primary key
#  content      :text             not null
#  read         :boolean
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  recipient_id :integer
#  sender_id    :integer
#
# Indexes
#
#  index_messages_on_recipient_id  (recipient_id)
#  index_messages_on_sender_id     (sender_id)
#

class Message < ApplicationRecord
    belongs_to :sender, :class_name => "User"
    belongs_to :recipient, :class_name => "User"
end
