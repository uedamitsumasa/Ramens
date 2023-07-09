class Publics::ShopsController < ApplicationController
   before_action :set_shop, only: [:show,:destroy]


  def index
    @shops = Shop.with_attached_shop_image.all
  end

  def show
  end

  private

  def set_shop
    @shop = Shop.find(params[:id])
  end
end