class RecipesController < ApplicationController
  def index
    @recipes = Recipe.cocktail.order(:name)
    render :index
  end

  def tag
    @recipes = Recipe.cocktail.joins(:tags).where("tags.id = ?", params[:tag_id]).order(:name)
    render :index
  end
end
