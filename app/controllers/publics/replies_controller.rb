class Publics::RepliesController < ApplicationController
  before_action :set_review, only: [:create]

  def create
    @reply = @review.replies.new(reply_params)
    @reply.user = current_user

    if @reply.save
      redirect_to publics_shop_path(@review.shop_id), notice: 'Reply was successfully created.'
    else
      redirect_to publics_shop_path(@review.shop_id), alert: 'Failed to create reply.'
    end
  end

  def destroy
    @reply = Reply.find(params[:id])
    unless @reply.user.id == current_user.id
      redirect_to publics_shop_path
    end
    @reply.destroy
    redirect_to root_path, notice: 'Reply was successfully deleted.'
  end

  def edit
    @reply = Reply.find(params[:id])
    unless @reply.user.id == current_user.id
      redirect_to publics_shop_path
    end
  end

  def update
    @reply = Reply.find(params[:id])
    unless @reply.user.id == current_user.id
      redirect_to publics_shop_path
    end
    @reply.update(reply_params)
    redirect_to root_path, notice: 'Reply was successfully update.'
  end



  private

  def set_review
    @review = Review.find(params[:reply][:review_id])
  end

  def reply_params
    params.require(:reply).permit(:content, :review_id)
  end
end

