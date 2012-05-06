class ChangeProductsToProductsTypeInIngredient < ActiveRecord::Migration
  def up
    rename_column :ingredients, :products, :products_type
  end

  def down
    rename_column :ingredients, :products_type, :products
  end
end
