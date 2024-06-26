# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    before_action :configure_sign_up_params, only: [:create]
    before_action :configure_account_update_params, only: [:update]
    # GET /resource/sign_up
    # def new
    #   super
    # end

    # POST /resource
    # def create
    #   super
    # end

    # GET /resource/edit
    # def edit
    #   super
    # end

    # PUT /resource
    # def update
    #   super
    # end

    def update_resource(resource, params)
      if resource.provider == 'google_oauth2' || resource.provider == 'mail_ru'
        params.delete('current_password')
        resource.password = params['password']

        resource.update_without_password(params)
      else
        resource.update_with_password(params)
      end
    end
    # DELETE /resource
    # def destroy
    #   super
    # end

    # GET /resource/cancel
    # Forces the session data which is usually expired after sign
    # in to be expired now. This is useful if the user wants to
    # cancel oauth signing in/up in the middle of the process,
    # removing all OAuth session data.
    # def cancel
    #   super
    # end

    protected

    # If you have extra params to permit, append them to the sanitizer.
    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up, keys: %i[name phone adress avatar])
    end

    # If you have extra params to permit, append them to the sanitizer.
    def configure_account_update_params
      devise_parameter_sanitizer.permit(:account_update, keys: %i[name phone adress avatar])
    end

    # The path used after sign up.
    def after_sign_up_path_for(resource_or_scope)
      stored_location_for(resource_or_scope) || super
    end

    # The path used after update.
    def after_update_path_for(resource_or_scope)
      stored_location_for(resource_or_scope) || super
    end
    # The path used after sign up for inactive accounts.
    # def after_inactive_sign_up_path_for(resource)
    #   super(resource)
    # end
  end
end
