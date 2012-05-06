class AddNumberToIngredient < ActiveRecord::Migration
  def change
    add_column :ingredients, :number, :string, :null => false

  end
end
