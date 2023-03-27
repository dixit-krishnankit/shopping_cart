require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validation tests" do
    context "Invalid inputs" do
      context "When username is not present." do
        it "Shoud not be validated." do
          user = User.new({password: "12345", password_confirmation: "12345"})
          expect(user.valid?).to eq(false)
        end
      end
    end
  end

  describe "Associations" do
    context "Association of users and cart_items" do
      it "User must have multiple cart_items" do
        association = User.reflect_on_association(:cart_items)
        expect(association.macro).to eq(:has_many)
      end
    end
  end

  describe "Function" do
    context "When calculate_total function is called" do
      it "Shoud return total cost of cart items" do
        user = User.new()
        user.cart_items.new({name: "Pentenoic", price: 10, quantity: 2, product_id: 13})
        user.cart_items.new({name: "Nirma", price: 15, quantity: 1, product_id: 14})
        expect(user.calculate_total).to eq(35)
      end
    end
  end
end
