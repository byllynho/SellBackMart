class UsersController < ApplicationController
  layout 'standard'

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
    @deals = []
    @user.items.each do |record| 
      if record.settlement
        @deals.push(record)
      end
    end
  end

end
