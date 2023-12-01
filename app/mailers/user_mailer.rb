# frozen_string_literal: true

class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.new_user_email.subject
  #
  def new_user_email(user)
    @user = user
    admins = User.where(admin: true)
    admins.each do |admin|
      mail(to: admin.email, subject: 'New user sign up')
    end
  end

  def success_registration_email(user)
    @user = user
    mail(to: @user.email, subject: 'Hello. You have registered')
  end
end
