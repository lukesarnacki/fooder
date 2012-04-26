class AddContentToLabel < ActiveRecord::Migration
  def change
    add_column :labels, :content, :text

  end
end
