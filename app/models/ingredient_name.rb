class IngredientName < ActiveRecord::Base
  belongs_to :ingredient
  validates :name, presence: true
end
