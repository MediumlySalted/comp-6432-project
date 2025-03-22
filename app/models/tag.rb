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

  validates :name, presence: true
  validates :color, presence: true

  validate :validate_color_format

  private

  def validate_color_format
    unless color.match?(/\A#(?:[0-9a-fA-F]{3}){1,2}\z/)
      errors.add(:color, "Tag color must be in the valid hexcode format (e.g. #054FCA)")
    end
  end
end
