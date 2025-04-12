class AddUserFkToColRecipes < ActiveRecord::Migration[8.0]
  def change
    add_reference :recipes, :user, foreign_key: true
  end
end
