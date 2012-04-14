class ProductIngredient < ActiveRecord::Base
  belongs_to :ingredient
  belongs_to :product
end
