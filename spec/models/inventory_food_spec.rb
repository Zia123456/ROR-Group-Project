require 'rails_helper'

RSpec.describe InventoryFood, type: :model do
  before :each do
    @user = User.new(name: 'userTEst', email: 'usesrTest@test.com', password: 123_456, password_confirmation: 123_456)
    @user.skip_confirmation!
    @user.save
    @inventory = Inventory.create(name: 'firstIv', description: 'test', user_id: @user.id)
    @food = Food.create(name: 'Pizza', measurement_unit: 'slice', price: 25)
  end

  it 'is valid' do
    inventory_food = InventoryFood.new(quantity: 4, inventory_id: @inventory.id, food_id: @food.id)
    expect(inventory_food).to be_valid
  end

  it 'not valid without quantity' do
    inventory_food = InventoryFood.new(inventory_id: @inventory.id, food_id: @food.id)
    expect(inventory_food).to_not be_valid
  end
end
