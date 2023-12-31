class Admins::ShopsController < ApplicationController
  before_action :set_shop, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)

    if @shop.save
      redirect_to admins_shops_path, notice: "Shop added successfully!"
    else
      flash.now[:alert] = '投稿に失敗しました'
      render :new
    end
  end

  def index
  if params[:search].present?
    @shops = Shop.where("name LIKE ?", "%#{params[:search]}%")
  else
    @shops = Shop.with_attached_shop_image.all
  end
  end

  def show
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    if @shop.update(shop_params)
      redirect_to admins_shop_path(@shop), notice: 'Shop was successfully updated.'
    else
      flash.now[:alert] = '投稿に失敗しました'
      render :edit
    end
  end

  def destroy
    @shop.destroy
    redirect_to admins_shops_path, notice: 'Shop was successfully deleted.'
  end


  private

  def shop_params
    params.require(:shop).permit(:name, :explanation, :post_code, :address, :phone_number, :open_time, :close_time,:shop_image,genre_ids: [],noodle_images: [])
  end

  def set_shop
    @shop = Shop.find(params[:id])
  end

end
