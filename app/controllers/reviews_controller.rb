class ReviewsController < ApplicationController
    layout 'standard'
    before_action :authenticate_user!

    def index
        @reviews = Review.all
        # render 'reviews/index.html.erb'
    end

    def new
        begin
            @user = User.find(params[:user_id])
            #@item = Item.find(params[:item_id])
          rescue 
            redirect_to review_url, alert: 'Error:User not found'
        end
        @review = Review.new
        # render 'reviews/new.html.erb'
    end

    def create
        begin
            @user = User.find(params[:user_id])
            #@item = Item.find(params[:item_id])
        rescue 
            redirect_to review_url, alert: 'Error:User not found'
        end
        @review = Review.new(params.require(:review).permit(:product, :description,:owner, :user_id, :item_id))
        @review.update(owner: current_user.name, reviewer: current_user.id)
        @user.reviews << @review
        if @user.save  
            redirect_to user_url(@user), notice: 'Your review has been successfully posted'
        else
            flash.now[:alert] = 'Error! Unable to post new review'
            render :new
        end
    end

    def edit
        @review = Review.find(params[:id])
        # render 'reviews/edit.html.erb'
    end

    def update
        begin
            @review = Review.find(params[:id])
        rescue 
            redirect_to reviews_url, alert: 'Error:User not found'
        end
        @review = Review.find(params[:id])
        if @review.update(params.require(:review).permit(:product,:description,:user_id))
            redirect_to user_url(@review.user_id), notice:'Review was successfully updated'
        else
          flash.now[:alert] = 'Error! Unable to update review'
          render :edit
        end
    end

    def destroy
        begin
            @review = Review.find(params[:id])
          rescue 
            redirect_to user_url, alert: 'Error:Review not found'
        end
        @user = @review.user_id
        @review.destroy
        redirect_to user_url(@user),  notice: 'Review successfully deleted'
    end

    def view_review
        begin
            @review = Review.find(params[:id])
        rescue
            redirect_to catalog_url, alert: "Sorry. The review you requested does not exist."
        end
        # render reviews/view_item.html.erb
    end

end