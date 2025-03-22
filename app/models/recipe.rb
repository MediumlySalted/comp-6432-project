# == Schema Information
#
# Table name: recipes
#
#  id          :integer          not null, primary key
#  name        :string
#  recipe_type :string
#  ingredients :string           is an Array
#  directions  :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Recipe < ApplicationRecord
  has_many(
    :recipe_tags,
    class_name: "RecipeTag",
    foreign_key: "recipe_id",
    inverse_of: :recipe,
    dependent: :destroy
  )

  has_many :tags, through: :recipe_tags

  enum :recipe_type, [ :food, :cocktail, :food_ingredient, :cocktail_ingredient ]

  validates :name, presence: true
  validates :recipe_type, inclusion: { in: recipe_types }
  validates :ingredients, presence: true
  validates :directions, presence: true

  validate :validate_ingredients_array

  private

  def validate_ingredients_array
    if ingredients.blank? || !ingredients.is_a?(Array) || ingredients.any? { |i| !i.is_a?(String) }
      errors.add(:ingredients, "Recipe ingredients must be a non-empty array of strings")
    end
  end
end
