class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:account_update, keys: [:firstname,:lastname, :dob, :phone])
    end

    rescue_from ActionController::RoutingError do |exception|
      logger.error 'Routing error occurred'
      render file: 'public/404.html', status: 404 
     end
end
