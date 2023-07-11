class Review < ApplicationRecord
  belongs_to :shop
  belongs_to :user
  has_many :replies
end

