# frozen_string_literal: true

module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    # You should configure your model like this:
    # devise :omniauthable, omniauth_providers: [:twitter]

    # You should also create an action method in this controller like this:
    def mail_ru
      auth_provider('Mail.ru')
    end

    def google_oauth2
      auth_provider('Google')
    end

    protected

    def after_omniauth_failure_path_for(_scope)
      new_user_session_path
    end

    def after_sign_in_path_for(resources_or_scope)
      stored_location_for(resources_or_scope) || root_path
    end

    private

    def auth_provider(provider)
      user = User.from_omniauth(auth)

      if user.present?
        sign_out_all_scopes
        flash[:success] = t 'devise.omniauth_callbacks.success', kind: provider
        sign_in_and_redirect user, event: :authentication
      else
        flash[:alert] =
          t 'devise.omniauth_callbacks.failure', kind: provider, reason: 'User is not authorized.'
        redirect_to new_user_session_path
      end
    end

    def auth
      @auth ||= request.env['omniauth.auth']
    end
  end
end
