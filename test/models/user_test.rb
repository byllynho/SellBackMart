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

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
