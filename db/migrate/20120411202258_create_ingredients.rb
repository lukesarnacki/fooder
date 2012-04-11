class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.integer :grade
      t.text :description
      t.text :explanation

      t.timestamps
    end
  end
end
