class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true
  has_many :cart_items

  def calculate_total 
    self.cart_items.map {|item| item[:price] * item[:quantity]}.sum()
  end
end
