class Ingredient < ActiveRecord::Base
  has_many  :names,
            class_name: "IngredientName",
            dependent: :destroy, order: "main ASC, name ASC"
  has_many :product_ingredients
  has_many :products, through: :product_ingredients

  #validates :names, length: { minimum: 1 }

  accepts_nested_attributes_for :names

  def name
    names_scope = names
    main_names = names_scope.where(main: true)
    main_names = main_names.empty? ? names_scope : main_names
    main_names.first.name
  end
end
