# frozen_string_literal: true

module CommentsHelper

  def comment_created?(product, user)
    Comment.where("#{product.id} = #{params[:product_id]} AND #{user.id} = #{params[:user_id]}").nil?
  end
end
