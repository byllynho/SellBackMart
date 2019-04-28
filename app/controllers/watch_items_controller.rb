class WatchItemsController < ApplicationController
    layout 'standard'
    before_action :authenticate_user!

    def index
        @watch_items = WatchItem.all
        # render 'watch_items/index.html.erb'
    end

    def new
        @watch_item = WatchItem.new
        # render 'watch_items/new.html.erb'
    end

    def create
        @user = current_user
        begin
            @watchlist= @user.watchlist
          rescue
            redirect_to my_profile_url, alert: 'Error: watch list not found!'
        end

        @watch_item = WatchItem.new(params.require(:watch_item).permit(:title, :category, :watchlist_id))
        @watchlist.items << @watch_item
        if @watchlist.save!
            redirect_to watchlist_url, notice: 'Your Watch Item has been successfully added.'
        else
            flash.now[:alert] = 'Error! Unable to post new WatchItem'
    
            render :new
        end
    end

    def edit
        @watch_item = WatchItem.find(params[:id])
        # render 'items/edit.html.erb'
    end
  
    def update
        @watch_item = WatchItem.find(params[:id])
        if @watch_item.update(params.require(:watch_item).permit(:title, :category))
            redirect_to watchlist_url , notice:'Watch item was successfully updated.'
        else
          flash.now[:alert] = 'Error! Unable to update watch item!'
          render :edit
        end
    end

    def destroy
        @watch_item = WatchItem.find(params[:id])
        @watch_item.destroy
        redirect_to watchlist_url,  notice: 'Watch Item successfully deleted!'
    end
    
   
    
end
