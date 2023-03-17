class AddProductIdToInventories < ActiveRecord::Migration[7.0]
  def change
    add_column :carts, :product_id, :integer
  end
end
