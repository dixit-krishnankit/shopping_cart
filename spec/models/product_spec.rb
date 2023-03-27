require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "Validations" do
    context "Invalid inputs" do
      context "name is not present" do
        it "should not validate" do
          product = Product.new({price: 10, quantity: 10, description: "Lorem ipsum dolor sit, amet consectetur adipisicing elit. Debitis ab ullam excepturi."})
          expect(product.valid?).to eq(false)
        end
      end

      context "price is not present" do
        it "should not validate" do
          product = Product.new({name: "Pentenoic", quantity: 10, description: "Lorem ipsum dolor sit, amet consectetur adipisicing elit. Debitis ab ullam excepturi."})
          expect(product.valid?).to eq(false)
        end
      end

      context "quantity is not present" do
        it "should not validate" do
          product = Product.new({name: "Pentenoic", price: 10, description: "Lorem ipsum dolor sit, amet consectetur adipisicing elit. Debitis ab ullam excepturi."})
          expect(product.valid?).to eq(false)
        end
      end

      context "description is not present" do
        it "should not validate" do
          product = Product.new({name: "Pentenoic", price: 10, quantity: 10})
          expect(product.valid?).to eq(false)
        end
      end

      context "description is smaller then 10 characters or larger than 100 characters." do
        it "should not validate" do
          product = Product.new({name: "Pentenoic", price: 10, quantity: 10, description: "Pen"})
          expect(product.valid?).to eq(false)
        end
      end
    end

    context "Valid inputs" do
      it "product shoud be validated." do
        product = Product.new({name: "Pentenoic", price: 10, quantity: 10, description: "Culpa officia exercitation est duis proident reprehenderit Lorem esse."})
        expect(product.valid?).to eq(true)
      end
    end
  end
end
