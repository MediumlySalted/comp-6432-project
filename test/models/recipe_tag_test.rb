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

require "test_helper"

class RecipeTagTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
