class PicturesController < ApplicationController
    layout 'standard'
    before_action :authenticate_user!

    def destroy
      begin
          @picture = Picture.find(params[:id])
      rescue 
          redirect_to item_url, alert:'Error: Image not found'
      end
      @item = @picture.item_id
      @picture.destroy
      redirect_to edit_item_url(@item), notice: 'Requested image was successfully deleted'
    end

end
