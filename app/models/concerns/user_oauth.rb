# frozen_string_literal: true

module UserOauth
  extend ActiveSupport::Concern
  class_methods do
    def from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email      = if auth.info.email.nil?
                            create_email(auth)
                          else
                            auth.info.email
                          end
        user.password   = Devise.friendly_token[0, 20]
        user.name       = if auth.info.name.nil?
                            "user#{auth.uid}"
                          else
                            auth.info.name
                          end
        user.avatar_url = auth.info.image unless auth.info.image.nil?
        user.address    = 'No Address'
        user.phone      = '+00000000000'
        user.admin      = false
      end
    end

    def create_email(auth)
      "#{auth.uid}@fashion_store.com"
    end
  end
end
