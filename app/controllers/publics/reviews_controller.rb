class Publics::ReviewsController < ApplicationController
  def new
    @review = Review.new
    @shop = Shop.find(params[:shop_id])
    @review.shop = @shop
  end

  def create
    @review = current_user.reviews.build(review_params)
    @shop = Shop.find(params[:shop_id])
    @review.shop = @shop
    if @review.save
      redirect_to [:publics, @review.shop], notice: 'Review was successfully created.'
    else
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
    unless @review.user.id == current_user.id
      redirect_to publics_shop_path
    end
    @shop = Shop.find(params[:shop_id])
  end

  def update
    @review = Review.find(params[:id])
    unless @review.user.id == current_user.id
      redirect_to publics_shop_path
    end
    if @review.update(review_params)
      redirect_to publics_shop_path(@review.shop), notice: '更新しました。'
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    unless @review.user.id == current_user.id
      redirect_to publics_shop_path
    end
    @review.destroy
    redirect_to publics_shop_path(@review.shop_id), notice: '削除しました。'
  end

  private

  def review_params
    params.require(:review).permit(:content, :shop_id, :star)
  end
end

