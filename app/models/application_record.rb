class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  :configure_permitted_parameters
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end
end
