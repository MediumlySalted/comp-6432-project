class RecipesController < ApplicationController
  before_action :authenticate_user!, except: [ :index ]
  def index
    @recipes = Recipe.order(:name)

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

  def new
    @recipe = Recipe.new
    @tags = Tag.all
  end

  def create
    ingredients_array = params[:recipe][:ingredients].to_s.split("\n").map(&:strip).reject(&:empty?)
    permitted = params.require(:recipe).permit(:name, :recipe_type, :ingredients, :directions, tag_ids: [])
    permitted[:ingredients] = ingredients_array
    @recipe = current_user.recipes.new(permitted)

    if @recipe.save
      flash[:success] = "New recipe successfully added!"
      redirect_to recipes_url
    else
      @tags = Tag.all.sort_by { |tag| @recipe.tags.include?(tag) ? 0 : 1 }
      flash.now[:error] = "Recipe creation failed"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @tags = Tag.all.sort_by { |tag| @recipe.tags.include?(tag) ? 0 : 1 }
  end

  def update
    @recipe = Recipe.find(params[:id])

    ingredients_array = params[:recipe][:ingredients].to_s.split("\n").map(&:strip).reject(&:empty?)
    permitted = params.require(:recipe).permit(:name, :recipe_type, :ingredients, :directions, tag_ids: [])
    permitted[:ingredients] = ingredients_array

    if @recipe.update(permitted)
      flash[:success] = "Recipe successfully updated!"
      redirect_to user_path
    else
      puts @recipe.errors.full_messages
      puts params[:recipe].inspect
      @tags = Tag.all.sort_by { |tag| @recipe.tags.include?(tag) ? 0 : 1 }
      flash.now[:error] = "Recipe update failed"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    flash[:success] = "The recipe was successfully deleted."
    redirect_to user_path, status: :see_other
  end
end
