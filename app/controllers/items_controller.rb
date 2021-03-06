class ItemsController < ApplicationController
    layout 'standard'
    before_action :authenticate_user!

    # def index
    #     @items = Item.all
    #     # render 'items/index.html.erb'
    # end

    def new
        @item = Item.new
        # render 'items/new.html.erb'
    end

    def create
        @item = Item.new(params.require(:item).permit(:avatar, :photo, :title, :price, :condition, :category_id, :description, :user_id))
        if @item.save!
            if params[:images]
                params[:images].each {|image|
                  @item.pictures.create(image: image)
                }
            end
            redirect_to item_url(@item), notice: 'Your item has been successfully posted'

            # for create watch item match
        
            @watchlists = Watchlist.all
            category_match = []
            @watchlists.each do |watchlist|
                if watchlist.user.watchlist_notifications
                    watchlist.items.each do |watchitem|
                        if watchitem.category == @item.category.id
                            category_match << watchitem
                        end
                    end
                end
            end
            category_match.each do |watchitem|
                if @item.title.to_s.downcase.include?(watchitem.title.to_s.downcase)
                    @match = Match.create!(title: @item.title, email: watchitem.watchlist.user.email)
                end
            end

        else
            flash.now[:alert] = 'Error! Unable to post new item'
            render :new
        end
    end

    def edit
        @item = Item.find(params[:id])
        # render 'items/edit.html.erb'
    end
  
    def update
        @item = Item.find(params[:id])
        if @item.update(params.require(:item).permit(:avatar, :photo, :title, :price, :condition, :category_id, :description, :inactive))
            if params[:images]
                params[:images].each {|image|
                  @item.pictures.create(image: image)
                }
            end
            redirect_to item_url(@item), notice:'Item record was successfully updated'
        else
          flash.now[:alert] = 'Error! Unable to update item record'
          render :edit
        end
    end

    def destroy
        @item = Item.find(params[:id])
        @item.destroy
        redirect_to catalog_url,  notice: 'Item record successfully deleted'
    end
    
    def view_item
        begin
            @item = Item.find(params[:id])
            @message = Message.new
        rescue
            redirect_to catalog_url, alert: "Sorry. The item you requested does not exist."
            
        end
        # render items/view_item.html.erb
    end
    
    def catalog
        @items = Item.all.sort_by {|item| item.category_id}
        @category_ids = Category.all.pluck(:id).to_s
        # render items/catalog.html.erb
    end

    def filter
        if params[:search].blank?
            @items = Item.where("category_id IN (?) AND (inactive = ? OR inactive = ?)", params[:categories], params[:sold], 0)
        else
            @items = Item.where("category_id IN (?) AND title LIKE ? AND (inactive = ? OR inactive = ?)", params[:categories], "%#{params[:search]}%", params[:sold],0)
        end
        @category_ids = params[:categories]
        render "items/catalog.html.erb"
    end

    def comment
        @item = Item.find(params[:item_id])
        
        @comment=BuyerComment.new(item_id: params[:item_id][0].to_i, comment_text: params[:comment_text], user_id: params[:user_id][0].to_i)
        if @comment.save
            if @item[0].seller.comment_notifications
                NotificationMailer.with(seller: @item[0].seller, buyer: @comment.buyer, item: @item).comment_email.deliver_now
            end
            return redirect_to item_url(@item), notice: "Comment sucessfully posted!"
        else
            return redirect_to item_url(@item), alert: 'Error: Unable to post comment. Please limit comment between 1 to 500 characters.'
        end
        
    end

    def respond
        @item = Item.find(params[:item_id])
        
        @response=SellerResponse.new(response_text: params[:response_text], buyer_comment_id: params[:buyer_comment_id])
        if @response.save
            if @response.comment.buyer.response_notifications
                NotificationMailer.with(seller: @item[0].seller, buyer: @response.comment.buyer, item: @item).response_email.deliver_now
            end
            return redirect_to item_url(@item), notice: "Response sucessfully posted!"
        else
            return redirect_to item_url(@item), alert: 'Error: Unable to post reponse. Please limit response between 1 to 500 characters.'
        end
    end

end
