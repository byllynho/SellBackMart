class PicturesController < ApplicationController
    layout 'standard'
    before_action :authenticate_user!

    def index
    end

    def new
        begin
          @item = Item.find(params[:item_id])
        rescue
          redirect_to edit_item_url, alert: 'Error: Item not found'
        end
        @picture = Picture.new
        # render 'pictures/new.html.erb'
    end    

    def create
        begin
          @item = Item.find(params[:item_id])
        rescue
          redirect_to catalog_url, alert: 'Error: Item not found'
        end
        @picture = Picture.new(params.require(:picture).permit(:image))
        @item.pictures << @picture
        if @item.save
          redirect_to item_url(@item), notice: 'Picture was successfully created.'
        else
          flash.now[:alert] = 'Error! Unable to upload picture.'
          render :new
        end
    end    

    def edit
        @picture = Picture.find(params[:id])
        # render 'multiple_choice_questions/edit.html.erb'
    end
    
    def update
      begin
        @picture = Picture.find(params[:id])
      rescue
          redirect_to quizzes_url, alert: 'Error: Multiple choice question not found'
      end
        if @picture.update(params.require(:picture).permit(:image))
          redirect_to item_url(@picture.item), notice: 'Picture was successfully updated.'
        else
          flash.now[:alert] = 'Error! Unable to update multiple choice question.'
          render :edit
        end
    end

    def destroy
      begin
          @picture = Picture.find(params[:id])
      rescue 
          redirect_to item_url, alert:'Error: Image not found'
      end
      @item = @picture.item_id
      @picture.destroy
      redirect_to item_url(@item), notice: 'Requested image was successfully destroyed'
    end

end
