class Shop < ApplicationRecord
  has_one_attached :shop_image
  has_many_attached :noodle_images


  VALID_POSTAL_CODE_REGEX = /\A\d{3}[-]?\d{4}\z/ #正規表現を//で/正規表現/とサンドすることを忘れないよう
  validates :post_code, presence: true, format: { with: VALID_POSTAL_CODE_REGEX }

  VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
  validates :phone_number, presence: true, format: { with: VALID_PHONE_REGEX }


  has_many :reviews, dependent: :destroy

  has_many :shop_genres, dependent: :destroy
  has_many :genres, through: :shop_genres, dependent: :destroy
end