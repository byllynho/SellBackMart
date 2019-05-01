class UsersController < ApplicationController
  layout 'standard'
  before_action :authenticate_user!

  def open_page
    redirect_to catalog_url
  end

  def show
    @user = User.find(params[:id])
    @deals = []
    @user.items.each do |record| 
      if record.settlement
        @deals.push(record)
      end
    end
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

  
  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.valid_password?(params[:user][:current_password]) && @user.update(params.require(:user).permit(:department, :major))
      redirect_to my_profile_url(@user), notice:'Your information was successfully updated'
    else
      flash.now[:alert] = 'Error! Unable to update your information!'
      render :edit
    end
  end

 
  

end

