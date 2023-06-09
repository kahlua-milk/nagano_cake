class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_furigana, :first_furigana, :postal_code,
                                                      :address, :telephone_number])
    devise_parameter_sanitizer.permit(:account_update, keys: [:last_name, :first_name, :last_furigana, :first_furigana, :postal_code,:address, :telephone_number])
  end
end
