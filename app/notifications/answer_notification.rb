# frozen_string_literal: true

# To deliver this notification:
#
# AnswerNotification.with(post: @post).deliver_later(current_user)
# AnswerNotification.with(post: @post).deliver(current_user)

class AnswerNotification < Noticed::Base
  # Add your delivery methods
  #
  deliver_by :database
  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Add required params
  #
  # param :post

  # Define helper methods to make rendering easier.
  #
  def answer
    params[:message]
  end

  def answer?
    params[:message].nil?
  end

  def creator
    answer.user
  end

  delegate :review, to: :answer

  delegate :product, to: :review

  def url
    product_path(params[:product])
  end
end
