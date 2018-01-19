class AddDislikeToRecipes < ActiveRecord::Migration[5.1]
  def change
    add_column :recipes, :dislike, :boolean, null: false, default: false
  end
end
