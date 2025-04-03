class RecipesController < ApplicationController
  def index
    @recipes = Recipe.cocktail.order(:name)

    # Filters recipes to require all tags queryied
    if params[:tag_ids].present?
      tag_ids = params[:tag_ids].split(",").map(&:to_i)
      @tags = Tag.where(tags: { id: tag_ids })
      @recipes = @recipes
        .joins(:tags)
        .where(tags: { id: tag_ids })
        .group("recipes.id")
        .having("COUNT(tags.id) = ?", tag_ids.size)
    end
  end
end
