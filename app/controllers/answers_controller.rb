# frozen_string_literal: true

class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_answer!, only: %i[destroy edit update]
  before_action :set_review!
  before_action :set_product!, only: %i[destroy edit update]
  before_action :set_reviews!, only: %i[destroy edit update]
  def create
    @answer = @review.answers.build answer_create_params
    @answer.user = current_user
    respond_to do |format|
      if @answer.save

        format.turbo_stream
        format.html do
          redirect_to product_path(@product), status: :see_other
        end
      else
        flash_errors_messages(@answer)
        format.turbo_stream do
          render turbo_stream: [turbo_stream.update('flash', partial: 'shared/flash')]
        end
      end
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @answer.update answer_update_params
        format.turbo_stream
      else
        flash_errors_messages(@answer)
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
      if @answer.destroy
        format.turbo_stream
      else
        format.turbo_stream do
          render turbo_stream: [turbo_stream.replace('reviews',
                                                     partial: 'reviews/reviews',
                                                     locals: { product: @product, reviews: @reviews }),
                                turbo_stream.update('flash',
                                                    partial: 'shared/flash')]
        end
        format.html do
          redirect_to product_path(@product), status: :see_other
        end
      end
    end
  end

  private

  def answer_create_params
    params.require(:answer).permit(:body).merge(user: current_user)
  end

  def answer_update_params
    params.require(:answer).permit(:body)
  end

  def set_answer!
    @answer = Answer.find(params[:id])
  end

  def set_review!
    @review = Review.find(params[:review_id])
  end

  def set_reviews!
    @reviews = Kaminari.paginate_array(@product.reviews).page(params[:page]).per(5)
  end

  def set_product!
    @product = @answer.review.product
  end

  def flash_errors_messages(object)
    object.errors.messages.each_value { |msg| flash[:danger] = "#{object.class} #{msg.join(', ')}" }
  end
end
