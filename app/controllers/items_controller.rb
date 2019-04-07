class ItemsController < ApplicationController
    layout 'standart'
    before_action :authenticate_user!
    
    def view_item
        begin
            @item = Item.find(params[:id])

        rescue
            redirect_to catalog_url, alert: "Sorry. The item you requested does not exist."
            
        end
        # render items/view_item.html.erb
    end
    
    def catalog
        @items = Item.all
        # render items/catalog.html.erb
    end

    def filter
        @items = Item.where("category_id IN (?)", params[:categories])
        render "items/catalog.html.erb"
    end
end