class CartItem < ApplicationRecord
  validates :product_id, presence: true
  belongs_to :user
end
