class Ingredient < ActiveRecord::Base
  has_many :ingredient_names, dependent: :destroy
  has_many :product_ingredients
  has_many :products, through: :product_ingredients
end
