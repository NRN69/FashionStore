# frozen_string_literal: true

class Answer < ApplicationRecord
  validates   :body, length: { minimum: 5, maximum: 100 }, presence: true

  belongs_to  :comment
  belongs_to  :user

  has_noticed_notifications
  after_create_commit { broadcast_notifications }

  private

  def broadcast_notifications
    return if user == comment.user

    AnswerNotification.with(message: self).deliver_later(comment.user)

    broadcast_prepend_to          "notifications_#{comment.user.id}",
                                  target: "notifications_#{comment.user.id}",
                                  partial: 'notifications/notification',
                                  locals: {
                                    user:,
                                    comment:,
                                    unread: true
                                  }
  end
end
