class RecipeFoodsController < ApplicationController

  def create
    recipe_foods = RecipeFood.new(quantity: params[:quantity])
    puts "Creating new recipe"
    recipe_foods.food_id = params[:food_id]
    recipe_foods.recipe_id = params[:recipe_id]
    recipe_foods.save
    redirect_to recipe_path(params[:recipe_id])
    flash[:notice] = 'igredient added'
  end

  # def edit
  #   @recipe = Recipe.find(params[:id])
  # end

  # def update
  #   @recipe_food = RecipeFood.find(params[:id])
  #   respond_to do |format|
  #     if @recipe_food.update(recipe_food_params)
  #       format.html { redirect_to recipe_url(@recipe_food), notice: 'recipe update' }
  #     else
  #       format.html { render :edit, alert: 'error of updating the recipe' }
  #     end
  #   end
  # end

  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.destroy
    redirect_to recipes_path, notice: "Recipe food was successfully deleted."
  end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity)
  end
end