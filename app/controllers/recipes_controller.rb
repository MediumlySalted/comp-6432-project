class RecipesController < ApplicationController
  def index
    @recipes = Recipe.order(:name)
    render :index
  end
end
