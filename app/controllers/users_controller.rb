class UsersController < ApplicationController
  layout 'standart'
  before_action :authenticate_user!

  def open_page

  end

end
