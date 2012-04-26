class AddImageToLabels < ActiveRecord::Migration
  def change
    add_column :labels, :image, :string
  end
end
