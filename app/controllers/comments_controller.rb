# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @product = Product.find(params[:product_id])
    @comment = @product.comments.create(comment_params)
    @comment.user = current_user
    @comment.save
    redirect_to product_path(@product)
  end

  def update
    if @comment.update comment_params
      respond_format
    else
      render :edit
    end
  end

  def destroy
    @answer.destroy
    respond_format
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def respond_format
    respond_to do |format|
      format.html do
        redirect_to product_path(@product), status: :see_other
      end

      format.turbo_stream do
        render turbo_stream:
                 [turbo_stream.replace('comment',
                                       partial: 'comments/comment',
                                       locals: { comment: }),
                  turbo_stream.replace(product_path)]
      end
    end
  end
end
