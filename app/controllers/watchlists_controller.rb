class WatchlistsController < ApplicationController
    layout 'standard'
    before_action :authenticate_user!
    def new
        @user = current_user
        @watchlist = Watchlist.new
        # render 'watchlists/new.html.erb'
    end

    def create
        @user = current_user
        @watchlist = Watchlist.new(user_id:@user.id)
        if @watchlist.save!
            redirect_to watchlist_url(@watchlist), notice: 'Your watch list has been created!'
        else
            flash.now[:alert] = 'Error! Unable to create watch list!'
            render :new
        end
    end

    def show
        @user = current_user
        @watchlist = current_user.watchlist
        # if @user.watchlist
        #     @watchlist =  @user.watchlist
        # else
        #     flash.now[:alert] = 'Error! Unable to create watch kist!'
        # # render 'watchlists/show.html.erb'
    end

    def index
        @watchlists = Watchlist.all
    end
end
