class CartController < ApplicationController
before_action :require_user_logged_in
skip_before_action :verify_authenticity_token, only: [:add_product]

  def index
    @cart_items = Current.user.cart_items
  end

  def add_product
    user = User.find(Current.user[:id])
    product = Product.find(params[:product_id])
    product_quantity = product[:quantity]
    product.update({quantity: product_quantity - 1})
    cart_item = Current.user.cart_items.find_by(product_id: product[:id])

    if (cart_item)
      quantity = cart_item[:quantity]
      cart_item.update({quantity: quantity + 1})
      redirect_to root_path, notice: "Product already in cart. Quantity updated."
    else
      new_cart_item = user.cart_items.new({name: product.name, price: product.price, quantity: 1, product_id: product[:id]})

      if (new_cart_item.save())
        redirect_to root_path, notice: "Product added successfully."
      else
        redirect_to root_path, alert: "Unable to add product."
      end
    end
  end

  def delete
    quantity = Current.user.cart_items.find_by(product_id: params[:product_id])[:quantity]
    if (Current.user.cart_items.delete_by(product_id: params[:product_id]))
      product = Product.find(params[:product_id])
      product_quantity = product[:quantity]
      product.update({quantity: product_quantity + quantity})
      redirect_to cart_path, notice: "Product removed successfully."
    else
      redirect_to cart_path, alert: "Unable to remove product."
    end
  end
end
