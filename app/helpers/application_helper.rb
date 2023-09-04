# frozen_string_literal: true

module ApplicationHelper
  def format_created_at(object)
    object.created_at.strftime('%d %B %Y, %H:%M')
  end

  def attached_filename(object)
    object.blob.filename.to_s.split('.')[0]
  end
end
