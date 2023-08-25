# frozen_string_literal: true

module CommentsHelper

  def comment_created?(product, user)
    product.comments.find_by(product_id: product.id) && product.comments.find_by(user_id: user.id)
  end
end
