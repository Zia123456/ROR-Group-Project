class RecipeFoodsController < ApplicationController
  def new
    @recipe_food = RecipeFood.new
    @recipe = Recipe.find(params[:recipe_id])
    @foods = Food.all
  end
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_foods.create(quantity: params[:quantity], food_id: params[:food_id])
    if @recipe_food.save
      redirect_to user_recipe_url(@recipe.user, @recipe), notice: 'ingredient add successfully'
    else
      render :new, alert: 'error'
    end
  end
  def edit
    @recipe_food = RecipeFood.find(params[:id])
    @foods = Food.all
  end
  def update
    @recipe_food = RecipeFood.find(params[:id])
    if @recipe_food.update(recipe_update_params)
      redirect_to user_recipe_url(@recipe_food.recipe.user, @recipe_food.recipe),
                  notice: 'recipe  updat Successfully'
    else
      redirect_to user_recipe_url(@recipe_food.recipe.user, @recipe_food.recipe), alert: 'error'
    end
  end
  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_foods.find(params[:id])
    @recipe_food.destroy
    flash[:notice] = 'ingredient delete'
    redirect_to user_recipe_url(@recipe.user, @recipe)
  end
  private
  def recipe_update_params
    params.permit(:quantity, :food_id)
  end
end