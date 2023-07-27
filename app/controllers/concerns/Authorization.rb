# frozen_string_literal: true

module Authorization
  extend ActiveSupport::Concern

  included do
    before_action :configure_permitted_parameters, if: :devise_controller?

    def current_user
      UserDecorator.decorate(super) unless super.nil?
    end

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_in, keys: %i[name phone])
      devise_parameter_sanitizer.permit(:sign_up, keys: %i[name phone])
      devise_parameter_sanitizer.permit(:account_update, keys: %i[name phone])
    end
  end
end
