# frozen_string_literal: true

class UserDecorator < ApplicationDecorator
  delegate_all

  def name_or_email
    return name if name.present?

    email.split('@')[0]
  end

  def user_avatar
    return avatar if avatar.present?

    'default_avatar.png'
  end
end
