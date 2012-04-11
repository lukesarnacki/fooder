class AddIndexToCategoryAncestry < ActiveRecord::Migration
  def change
    add_index :categories, :ancestry
  end
end
