class Product < ActiveRecord::Base
  belongs_to :company
  belongs_to :category
  has_many :product_ingredients
  has_many :ingredients, through: :product_ingredients

  validates :name, :presence => true
end
