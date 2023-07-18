class Admins::ReviewsController < ApplicationController
  def index
    if params[:search].present?
      @user_ids = User.where("nickname LIKE ?", "%#{params[:search]}%").pluck(:id)
      @reviews = Review.where("content LIKE ? OR user_id IN (?)", "%#{params[:search]}%", @user_ids)
      @replies = Reply.joins(:review).where("reviews.content LIKE ?", "%#{params[:search]}%")
    else
      @reviews = Review.all
      @replies = Reply.all
    end
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
