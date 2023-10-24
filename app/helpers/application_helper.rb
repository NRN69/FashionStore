# frozen_string_literal: true

module ApplicationHelper
  def format_created_at(object)
    object.created_at.strftime('%d %B %Y, %H:%M')
  end

  def attached_filename(object)
    object.blob.filename.to_s.split('.')[0]
  end

  def user_avatar
    return current_user.avatar if current_user.avatar.attached?

    return current_user.avatar_url if !current_user.avatar.attached? && !current_user.avatar_url.nil?

    'default_avatar.png'
  end
end
