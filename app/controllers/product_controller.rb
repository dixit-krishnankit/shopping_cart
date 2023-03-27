class ProductController < ApplicationController
  def edit
    @product = Product.find(params[:id])
  end

  def update
    product = Product.find(params[:id])
    if (product.update(product_params))
      redirect_to admin_path, notice: "Product updated successfully."
    else
      redirect_to admin_path, notice: "Unable to update product."
    end
  end

  private
  def product_params
    params.require(:product).permit(:name, :price, :quantity, :description)
  end
end
