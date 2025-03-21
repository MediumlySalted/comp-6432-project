class RecipesController < ApplicationController
  def index
    @current_url_path = request.original_fullpath
    @recipes = Recipe.order(:name)
    render :index
  end

  def tag
    @current_url_path = request.original_fullpath
    @recipes = Recipe.joins(:tags).where("tags.id = ?", params[:tag_id]).order(:name)
    render :index
  end
end
