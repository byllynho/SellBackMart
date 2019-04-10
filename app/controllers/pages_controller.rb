class PagesController < ApplicationController
  layout 'first_page'
  
    def home
      #render 'home.html.erb'  
    end

    def bad_url
      redirect_to catalog_url, alert: "Sorry. We couldn't find the page you requested."
    end

   
  
  
  
  
  
end
  