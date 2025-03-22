class RenameTypeToRecipeTypeForRecipes < ActiveRecord::Migration[8.0]
  def change
    rename_column :recipes, :type, :recipe_type
  end
end
