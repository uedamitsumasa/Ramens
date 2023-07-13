class Admins::ReviewsController < ApplicationController
  def index
    @reviews = Review.all
    @replies = Reply.all
  end

  def show
    @review = Review.find(params[:id])
    @replies = @review.replies
  end
  
  def destroy
  @review = Review.find(params[:id])
  @review.destroy
  redirect_to admins_reviews_path, notice: 'Review was successfully deleted.'
  end
  
end
