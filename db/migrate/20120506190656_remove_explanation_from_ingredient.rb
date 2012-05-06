class RemoveExplanationFromIngredient < ActiveRecord::Migration
  def up
    remove_column :ingredients, :explanation
  end

  def down
    add_column :ingredients, :explanation, :text
  end
end
