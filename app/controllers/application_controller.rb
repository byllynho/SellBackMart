class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end

    def after_sign_in_path_for(resource)
        catalog_path() #your path
    end

    protected
    def after_confirmation_path_for(resource_name, resource)
        catalog_path()
    end

end
