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

require "test_helper"

class RecipeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
