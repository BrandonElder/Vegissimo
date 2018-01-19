class AddIndexToRecipes < ActiveRecord::Migration[5.0]
  def change
    add_column :recipes, :user_id, :integer
    add_index :recipes, :user_id, using: 'btree'
  end
end