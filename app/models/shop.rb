class Shop < ApplicationRecord
  has_one_attached :shop_image
  has_many_attached :noodle_images
  has_many :reviews, dependent: :destroy
end