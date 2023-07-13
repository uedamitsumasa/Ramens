class Genre < ApplicationRecord
  has_many :shop_genres, dependent: :destroy
  has_many :shops, through: :shop_genres, dependent: :destroy
end
