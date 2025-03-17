# == Schema Information
#
# Table name: recipe_tags
#
#  id         :integer          not null, primary key
#  recipe_id  :integer          not null
#  tag_id     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_recipe_tags_on_recipe_id  (recipe_id)
#  index_recipe_tags_on_tag_id     (tag_id)
#

class RecipeTag < ApplicationRecord
  belongs_to(
    :recipe,
    class_name: "Recipe",
    foreign_key: "recipe_id",
    inverse_of: :recipe_tags
  )

  belongs_to(
    :tag,
    class_name: "Tag",
    foreign_key: "tag_id",
    inverse_of: :recipe_tags
  )
end
