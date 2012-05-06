class AddFoodInfoAttributesToIngredient < ActiveRecord::Migration
  def change
    add_column :ingredients, :origin, :text
    add_column :ingredients, :products, :text
    add_column :ingredients, :daily_intake, :text
    add_column :ingredients, :side_effects, :text
    add_column :ingredients, :dietary_restrictions, :text
  end
end
