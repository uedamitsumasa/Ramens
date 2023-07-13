class ShopGenre < ApplicationRecord
  belongs_to :genre
  belongs_to :shop
end
