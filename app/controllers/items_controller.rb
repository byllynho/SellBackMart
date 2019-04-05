class ItemsController < ApplicationController
    def index
        @items = Item.all
        # render 'items/index.html.erb'
    end

    def new
        @item = Item.new
        # render 'items/new.html.erb'
    end

    def show
        @item = Item.find(params[:id])
        # render 'items/show.html.erb'
    end

    def create
        @item = Item.new(params.require(:item).permit(:title, :price, :image, :condition, :category_id, :description))
        if @item.save
            redirect_to items_url(), notice: 'Your item has been successfully posted!'
        else
            flash.now[:alert] = 'Error! Unable to post new item'
            render :new
        end
    end
end
