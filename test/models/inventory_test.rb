require 'rails_helper'

RSpec.describe Inventory, type: :model do
  before :each do
    @user = User.new(name: 'first_test', email: 'firstTest@test.com', password: 123_456,
                     password_confirmation: 123_456)
    @user.skip_confirmation!
    @user.save
  end

  it 'is valid' do
    inventory = Inventory.new(name: 'Inv1', description: 'testInv', user_id: @user.id)
    expect(inventory).to be_valid
  end

  it 'not valid without a name' do
    inventory = Inventory.new(description: 'testInv', user_id: @user.id)
    expect(inventory).to_not be_valid
  end

  it 'not valid without a description' do
    inventory = Inventory.new(name: 'Inv1', user_id: @user.id)
    expect(inventory).to_not be_valid
  end
end
