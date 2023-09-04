# frozen_string_literal: true

class Answer < ApplicationRecord
  validates   :body, length: { minimum: 5, maximum: 200 }, presence: true

  belongs_to  :review
  belongs_to  :user

  has_noticed_notifications
  after_create_commit { broadcast_notifications }

  private

  # rubocop:disable Metrics/AbcSize
  def broadcast_notifications
    return if user == review.user

    AnswerNotification.with(message: self).deliver_later(review.user)

    broadcast_prepend_to          "notifications_#{review.user.id}",
                                  target: "notifications_#{review.user.id}",
                                  partial: 'notifications/notification',
                                  locals: {
                                    user:,
                                    review:,
                                    product: review.product,
                                    unread: true
                                  }
  end
  # rubocop:enable Metrics/AbcSize
end
