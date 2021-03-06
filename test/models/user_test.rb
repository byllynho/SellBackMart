# == Schema Information
#
# Table name: users
#
#  id                      :integer          not null, primary key
#  comment_notifications   :boolean          default(TRUE)
#  confirmation_sent_at    :datetime
#  confirmation_token      :string
#  confirmed_at            :datetime
#  deleted_at              :datetime
#  department              :string
#  email                   :string           default(""), not null
#  encrypted_password      :string           default(""), not null
#  major                   :string
#  message_notifications   :boolean          default(TRUE)
#  name                    :string           not null
#  reset_password_sent_at  :datetime
#  reset_password_token    :string
#  response_notifications  :boolean          default(TRUE)
#  watchlist_notifications :boolean          default(TRUE)
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = User.new(name: "Example User", password:'123456', major: 'Computer Science', department: 'Computer Science', email: "user@example.com")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = ""
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end
end
