class UsersController < ApplicationController
  layout 'standard'
  before_action :authenticate_user!

  def open_page
    redirect_to catalog_url
  end

  def show
    @user = User.find(params[:id])
  end
  
  def index
    @users = User.all
  end

  def my_profile
    #need change when merge with log-in"
    @user = current_user
  end

end
