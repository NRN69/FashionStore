# frozen_string_literal: true

module ReviewsHelper
  def review_created?(product, user)
    product.reviews.find_by(product_id: product.id) && product.reviews.find_by(user_id: user.id)
  end

  def star_rating_class(product, index)
    if !product.reviews.empty? && index < product.reviews.average(:rating)
      '-fill'
    else
      ''
    end
  end
end
