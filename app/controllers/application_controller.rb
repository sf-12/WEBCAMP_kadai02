class ApplicationController < ActionController::Base
# 	before_action :authenticate_user!
	before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def after_sign_in_path_for(resource)
    user_path(current_user)
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
  
  def check_sign_in?
    unless user_signed_in?
      #サインインしていないユーザーはログインページが表示される
      redirect_to new_user_session_path
    end
  end
  
end
