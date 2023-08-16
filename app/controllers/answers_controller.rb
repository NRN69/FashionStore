# frozen_string_literal: true

class AnswersController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = Comment.find(params[:comment_id])
    @answer = @comment.answers.create(answer_params)
    @answer.user = current_user
    @answer.save
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

  def respond_format
    respond_to do |format|
      format.html do
        redirect_to product_path(@product), status: :see_other
      end

      format.turbo_stream do
        render turbo_stream:[turbo_stream.replace('comment',
                                                  partial: 'comments/comment',
                                                  locals: { comment: }),
                 turbo_stream.replace('answer',
                                       partial: 'answers/answer',
                                       locals: { answer: @comment.answer }),
                  turbo_stream.replace(product_path)]
      end
    end
  end

  def answer_params
    params.require(:answer).permit(:body)
  end
end
