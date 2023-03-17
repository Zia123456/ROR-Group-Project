class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.author = current_user
    # respond_to do |format|
    #   if @recipe.save
    #     format.html { redirect_to recipe_url(@recipe), notice: 'recipe made' }
    #   else
    #     format.html { render :new, alert: 'error of creating the recipe' }
    #   end
    # end
    if @recipe.save
      flash[:notice] = 'recipe created successfully!'
      redirect_to recipes_path
    else
      flash[:alert] = "Couldn't create recipe!"
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @recipe = Recipe.find(params[:id])
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to recipe_url(@recipe), notice: 'recipe update' }
      else
        format.html { render :edit, alert: 'error of updating the recipe' }
      end
    end
  end

  def public
    @public_recipes = Recipe.where(public: true)
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'recipe deleted' }
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
