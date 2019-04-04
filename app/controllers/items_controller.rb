class ItemsController < ApplicationController

    def view_item
        begin
            @item = Item.find(params[:id])

        rescue
            redirect_to home_url, alert: "Sorry. The item you requested does not exist."
            
        end
        # render items/view_item.html.erb
    end
end