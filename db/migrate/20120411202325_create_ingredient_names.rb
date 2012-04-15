class CreateIngredientNames < ActiveRecord::Migration
  def change
    create_table :ingredient_names do |t|
      t.string :name, null: false
      t.boolean :main, null: false, default: false
      t.integer :ingredient_id, :null => false

      t.timestamps
    end
  end
end
