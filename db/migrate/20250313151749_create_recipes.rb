class CreateRecipes < ActiveRecord::Migration[8.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :type
      t.string :ingredients, array: true
      t.text :directions

      t.timestamps
    end
  end
end
