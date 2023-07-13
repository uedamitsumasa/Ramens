class Shop < ApplicationRecord
  has_one_attached :shop_image
  has_many_attached :noodle_images
  has_many :reviews, dependent: :destroy

  has_many :shop_genres, dependent: :destroy
  has_many :genres, through: :shop_genres, dependent: :destroy
end