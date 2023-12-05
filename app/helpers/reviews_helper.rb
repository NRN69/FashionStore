# frozen_string_literal: true

module ReviewsHelper
  def review_created?(product, user)
    product.reviews.find_by(product_id: product.id) && product.reviews.find_by(user_id: user.id)
  end

  def star_rating_class(product, index)
    return '-fill' if !product.reviews.empty? && index < rating_average(product)

    ''
  end

  def user_rating_product(review, index)
    return '-fill' if !review.nil? && index < review.rating

    ''
  end

  def rating_average(product)
    rating = []
    product.reviews.each do |review|
      rating << review.rating.to_i if review.rating.positive?
    end
    rating.reduce(:+) / rating.size.to_f.round(half: :up)
  end
end
