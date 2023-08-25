# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment!, only: %i[destroy edit update]
  before_action :set_product!

  def create
    @comment = @product.comments.build comment_create_params
    @comment.user = current_user
    respond_to do |format|

      if @comment.save

        format.turbo_stream

        format.html do
          redirect_to product_path(@product), status: :see_other
        end

      else
        flash_errors_messages(@comment)
        format.turbo_stream do
          render turbo_stream: [turbo_stream.replace(Comment.new,
                                                     partial: 'comments/new',
                                                     locals: { product: @product, comment: Comment.new }),
                                turbo_stream.update('flash',
                                                    partial: 'shared/flash')]
        end
      end
    end
  end

  def update
    respond_to do |format|
      if @comment.update comment_update_params
        format.turbo_stream
      else
        flash_errors_messages(@comment)
        format.turbo_stream do
          render turbo_stream: [turbo_stream.replace('comments',
                                                     partial: 'comments/comments',
                                                     locals: { product: @product }),
                                turbo_stream.update('flash',
                                                    partial: 'shared/flash')]
        end
      end
      format.html do
        redirect_to product_path(@product), status: :see_other
      end
    end
  end

  def new; end

  def edit; end

  def destroy
    respond_to do |format|
      if @comment.destroy
        format.turbo_stream
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace('comments',
                                                    partial: 'comments/comments',
                                                    locals: { product: @product })
        end
        format.html do
          redirect_to product_path(@product), status: :see_other
        end
      end
    end
  end

  private

  def comment_create_params
    params.require(:comment).permit(:body).merge(user: current_user)
  end

  def comment_update_params
    params.require(:comment).permit(:body)
  end

  def set_comment!
    @comment = Comment.find(params[:id])
  end

  def set_product!
    @product = Product.find(params[:product_id])
  end

  def flash_errors_messages(object)
    object.errors.messages.each_value { |msg| flash[:danger] = "#{object.class} #{msg.join(', ')}" }
  end
end
