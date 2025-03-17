# == Schema Information
#
# Table name: recipes
#
#  id          :integer          not null, primary key
#  name        :string
#  type        :string
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
end
