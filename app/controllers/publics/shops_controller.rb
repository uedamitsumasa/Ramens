class Publics::ShopsController < ApplicationController
  before_action :set_shop, only: [:show, :destroy]

  def index
    @shops = Shop.all.with_attached_shop_image.distinct

    if params[:genre_ids].present?
      @shops = @shops.joins(:genres).where(genres: { id: params[:genre_ids] })
    end

    if params[:keyword].present?
      @shops = @shops.where('shops.name LIKE :keyword OR shops.address LIKE :keyword', keyword: "%#{params[:keyword]}%")
    end
  end

  def show
  end

  private

  def set_shop
    @shop = Shop.find(params[:id])
  end
end
