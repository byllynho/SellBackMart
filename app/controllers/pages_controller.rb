class PagesController < ApplicationController
  layout 'first_page'
  
    def home
      if user_signed_in?
        redirect_to catalog_url, alert: "You are already signed in."
      else
      render 'home.html.erb'
      end
    end

    def bad_url
      authenticate_user!
      redirect_to catalog_url, alert: "Sorry. We couldn't find the page you requested."
    end

   
  
  
  
  
  
end
  