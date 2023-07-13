class Admins::RepliesController < ApplicationController
  def destroy
  @reply = Reply.find(params[:id])
  @reply.destroy
  redirect_to admins_review_path(@reply.review), notice: 'Reply was successfully deleted.'
  end
end
