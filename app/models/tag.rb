# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :string
#  color      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tag < ApplicationRecord
  has_many(
    :recipe_tags,
    class_name: "RecipeTag",
    foreign_key: "tag_id",
    inverse_of: :tag,
    dependent: :destroy
  )

  has_many :recipes, through: :recipe_tags
end
