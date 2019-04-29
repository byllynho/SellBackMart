class ApplicationController < ActionController::Base
    before_action :persist_last_visited_path, :configure_permitted_parameters, if: :devise_controller?

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end
    

    def after_sign_in_path_for(resource)
        if session[:last_visited_path].present?
            session[:last_visited_path]
        else
            catalog_path() #your path
        end
    end

    protected
    def after_confirmation_path_for(resource_name, resource)
        catalog_path()
    end

    private
    def persist_last_visited_path
        unless Rails.configuration.ignored_paths.include?(request.path) || request.xhr?
            session[:last_visited_path] = request.path
        end
    end

end
