class RecipesController < ApplicationController
  before_action :authenticate_user!, except: [ :index ]

  def index
    @recipes = Recipe.order(:name)

    # Keyword seaches a specific filter
    if params[:search].present? && params[:filter].present?
      case params[:filter]
      when "Name"
        @recipes = @recipes.where("recipes.name ILIKE ?", "%#{params[:search]}%")
      when "Ingredients"
        @recipes = @recipes.where("recipes.ingredients::text ILIKE ?", "%#{params[:search]}%")
      when "Tag"
        @recipes = @recipes.joins(:tags).where("tags.name ILIKE ?", "%#{params[:search]}%")
      end

    # Filters recipes to require all tags queried when not searching
    elsif params[:tag_ids].present?
      tag_ids = params[:tag_ids].split(",").map(&:to_i)
      @tags = Tag.where(tags: { id: tag_ids })
      @recipes = @recipes
        .joins(:tags)
        .where(tags: { id: tag_ids })
        .group("recipes.id")
        .having("COUNT(tags.id) = ?", tag_ids.size)
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @tags = Tag.all.sort_by { |tag| @recipe.tags.include?(tag) ? 0 : 1 }
  end

  def new
    @recipe = Recipe.new
    @tags = Tag.all
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    flash[:alert] = "The recipe was successfully deleted."
    redirect_to user_path(current_user), status: :see_other
  end

  def create
    parameters = params.require(:recipe).permit(:name, :recipe_type, :ingredients, :directions, tag_ids: [])

    # Sanitize input parameters
    parameters[:name] = sanitize_example(params[:recipe][:name])
    parameters[:ingredients] = sanitize_example(params[:recipe][:ingredients]).to_s.split("\n").map(&:strip).reject(&:empty?)
    parameters[:directions] = sanitize_example(params[:recipe][:directions])

    @recipe = current_user.recipes.new(parameters)
    if @recipe.save
      flash[:success] = "New recipe successfully added!"
      redirect_to user_path(current_user)
    else
      @tags = Tag.all.sort_by { |tag| @recipe.tags.include?(tag) ? 0 : 1 }
      flash.now[:error] = "Recipe creation failed"
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @recipe = Recipe.find(params[:id])
    parameters = params.require(:recipe).permit(:name, :recipe_type, :ingredients, :directions, tag_ids: [])

    # Sanitize input parameters
    parameters[:name] = sanitize_example(params[:recipe][:name])
    parameters[:ingredients] = sanitize_example(params[:recipe][:ingredients]).to_s.split("\n").map(&:strip).reject(&:empty?)
    parameters[:directions] = sanitize_example(params[:recipe][:directions])

    if @recipe.update(parameters)
      flash[:notice] = "Recipe successfully updated!"
      redirect_to user_path(current_user)
    else
      @tags = Tag.all.sort_by { |tag| @recipe.tags.include?(tag) ? 0 : 1 }
      flash.now[:error] = "Recipe update failed"
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def sanitize_example(input)
    # Matches JavaScript tags and removes them along with their content
    input.gsub(/<script.*?>.*?<\/script>/im, "")
  end
end
