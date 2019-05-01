class MatchesController < ApplicationController
    layout 'standard'
    before_action :authenticate_user!

    def index
        @matches = Match.all
        
    end


    def new
        @match = Match.new
        
    end

    def create
        @match = Match.new(params.require(:match).permit(:title, :email))
        @match.save!
        # if @match.save!
        #     if params[:images]
        #         params[:images].each {|image|
        #           @item.pictures.create(image: image)
        #         }
        #     end
        #     redirect_to item_url(@item), notice: 'Your item has been successfully posted'
        # else
        #     flash.now[:alert] = 'Error! Unable to post new item'
        #     render :new
        # end
    end

    def edit
        @match = Match.find(params[:id])
        # render 'items/edit.html.erb'
    end
  
    
end