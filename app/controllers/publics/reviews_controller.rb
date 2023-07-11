class Publics::ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @review = current_user.reviews.build(review_params)
    if @review.save
      redirect_to [:publics, @review.shop], notice: 'Review was successfully created.'
    else
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to publics_shop_path(@review.shop), notice: '更新しました。'
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to publics_shop_path(@review.shop_id), notice: '削除しました。'
  end

  private

  def review_params
    params.require(:review).permit(:content, :shop_id)
  end
end

