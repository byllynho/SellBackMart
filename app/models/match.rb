# == Schema Information
#
# Table name: matches
#
#  id         :integer          not null, primary key
#  email      :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Match < ApplicationRecord
end
