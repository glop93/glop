class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_up_path_for(resource)
    if resource.is_a?(User)
      flash.clear
      flash[:success] = "Signed up Successfully!"
      root_path
    end
  end

  #redirect after sign in
  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(User)
      flash.clear
      flash[:success] = "Signed in Successfully!"
      root_path
    end
  end

protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:firstname,:lastname, :email, :password) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:firstname,:lastname, :username, :email, :password, 
                                                                   :university, :gender, :password_confirmation,:current_password) }
  end
end
