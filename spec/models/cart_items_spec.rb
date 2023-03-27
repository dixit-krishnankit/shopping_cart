require 'rails_helper'

RSpec.describe CartItem, type: :model do
  describe "Validations" do
    context "Invalid test" do
      context "When cart_items does not containt product_id" do
        it "Should not validate" do
          cart_item = User.new().cart_items.new(name: "Pentenoic", price: 10, quantity: 10)
          expect(cart_item.valid?).to eq(false)
        end
      end
    end

  context "Valid tests" do
    context "When cart_items contains all fields" do
      it "Should be validated" do
        cart_item = User.new().cart_items.new(name: "Pentenoic", price: 10, quantity: 10, product_id: 13)
        expect(cart_item.valid?).to eq(true)
      end
    end
  end
  end

  describe "Association" do
    context "Association between cart_items and users" do
      it "cart_item belongs to user" do
        association = CartItem.reflect_on_association(:user)
        expect(association.macro).to eq(:belongs_to)
      end
    end
  end
end
