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
        @item = Item.new(params.require(:item).permit(:avatar, :title, :price, :condition, :category_id, :description, :inactive))
        if @item.save
            redirect_to item_url(@item), notice: 'Your item has been successfully posted'
        else
            flash.now[:alert] = 'Error! Unable to post new item'
            render :new
        end
    end
end
