require 'rails_helper'

RSpec.describe Inventory, type: :model do
  before :each do
    @user = User.new(name: 'testUser', email: 'userTest@test.com', password: 123_456, password_confirmation: 123_456)
    @user.skip_confirmation!
    @user.save
  end

  it 'is valid' do
    inventory = Inventory.new(name: 'firstInv', description: 'test', user_id: @user.id)
    expect(inventory).to be_valid
  end

  it 'not valid without a name' do
    inventory = Inventory.new(description: 'test', user_id: @user.id)
    expect(inventory).to_not be_valid
  end

  it 'not valid without a description' do
    inventory = Inventory.new(name: 'firstInv', user_id: @user.id)
    expect(inventory).to_not be_valid
  end
end
