class Admins::RepliesController < ApplicationController
  before_action :authenticate_admin!
  def destroy
  @reply = Reply.find(params[:id])
  @reply.destroy
  redirect_to admins_review_path(@reply.review), notice: 'Reply was successfully deleted.'
  end
end
