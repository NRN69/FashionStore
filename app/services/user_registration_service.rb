# frozen_string_literal: true

class UserRegistrationService
  def self.call(user)
    return unless user.persisted?

    UserMailer.new_user_email(user).deliver_later
    UserMailer.success_registration_email(user).deliver_later
  end
end
