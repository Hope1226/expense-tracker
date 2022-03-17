class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name])
  end

  def after_sign_out_path_for(_user)
    new_user_session_path
  end

  def after_sign_up_path_for(_user)
    flash[:notice] = 'Wellcome to fitmate, your personal expense tracker!'
    categories_path
  end

  def after_update_path_for(_user)
    categories_path
  end

  def after_sign_in_path_for(_user)
    flash[:notice] = "Wellcome back, #{current_user.name}!"
    categories_path
  end
end
