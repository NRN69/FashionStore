# frozen_string_literal: true

class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_review!, only: %i[destroy edit update]
  before_action :set_product!
  before_action :set_reviews!

  # rubocop:disable Metrics/AbcSize

  def create
    @review = @product.reviews.build review_create_params
    @review.user = current_user
    respond_to do |format|
      if @review.save

        format.turbo_stream

        format.html do
          redirect_to product_path(@product), status: :see_other
        end

      else
        flash_errors_messages(@review)
        format.turbo_stream do
          render turbo_stream: [turbo_stream.replace(Review.new,
                                                     partial: 'reviews/new',
                                                     locals: { product: @product, review: Review.new }),
                                turbo_stream.update('flash',
                                                    partial: 'shared/flash')]
        end
      end
    end
  end

  def edit; end

  # rubocop:enable Metrics/AbcSize

  def update
    respond_to do |format|
      if @review.update review_update_params
        format.turbo_stream
      else
        flash_errors_messages(@review)
        format.turbo_stream do
          render turbo_stream: [turbo_stream.replace('reviews',
                                                     partial: 'reviews/reviews',
                                                     locals: { product: @product, reviews: @reviews }),
                                turbo_stream.update('flash',
                                                    partial: 'shared/flash')]
        end
      end
      format.html do
        redirect_to product_path(@product), status: :see_other
      end
    end
  end

  def destroy
    respond_to do |format|
      if @review.destroy
        format.turbo_stream
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace('reviews',
                                                    partial: 'reviews/reviews',
                                                    locals: { product: @product, reviews: @reviews })
        end
        format.html do
          redirect_to product_path(@product), status: :see_other
        end
      end
    end
  end

  private

  def review_create_params
    params.require(:review).permit(:body, :rating).merge(user: current_user)
  end

  def review_update_params
    params.require(:review).permit(:body)
  end

  def set_reviews!
    @reviews = Kaminari.paginate_array(@product.reviews).page(params[:page]).per(5)
  end

  def set_review!
    @review = Review.find(params[:id])
  end

  def set_product!
    @product = Product.find(params[:product_id])
  end

  def flash_errors_messages(object)
    object.errors.messages.each_value { |msg| flash[:danger] = "#{object.class} #{msg.join(', ')}" }
  end
end
