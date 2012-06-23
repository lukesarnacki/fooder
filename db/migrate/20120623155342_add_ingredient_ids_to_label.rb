class AddIngredientIdsToLabel < ActiveRecord::Migration
  def change
    add_column :labels, :ingredient_ids, :integer_array
  end
end
