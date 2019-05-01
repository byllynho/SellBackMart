class ApplicationController < ActionController::Base
    #around_action :set_current_user
    before_action :configure_permitted_parameters, if: :devise_controller?
    
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :department, :major])
    end

    def after_sign_in_path_for(resource)
        catalog_path() #your path
    end

    # def set_current_user
    #     Current.user = current_user
    #     yield
    #   ensure
    #     # to address the thread variable leak issues in Puma/Thin webserver
    #     Current.user = nil
    #   end             
    # end


    protected
    def after_confirmation_path_for(resource_name, resource)
        catalog_path()
    end



    
end
