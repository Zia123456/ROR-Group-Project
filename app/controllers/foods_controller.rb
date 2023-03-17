class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def show; end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    @food.author = current_user
    if @food.save
      flash[:notice] = 'Food created successfully!'
      redirect_to foods_path
    else
      flash[:alert] = "Couldn't create food!"
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    redirect_to root_path
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
