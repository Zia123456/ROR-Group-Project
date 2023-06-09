require 'rails_helper'

RSpec.describe Recipe, type: :model do
  before :each do
    @user = User.new(name: 'testUser', email: 'testUser@test.com', password: 0123_456, password_confirmation: 0123_456)
    @user.skip_confirmation!
    @user.save
  end
  it 'is valid' do
    recipe = Recipe.new(name: 'Pizza', preparation_time: '2 hours', cooking_time: '2 hours',
                        description: 'Test', public: false, user_id: @user.id, user: @user)
    expect(recipe).to be_valid
  end
  it 'recipe should not be valid without a name' do
    recipe = Recipe.new(name: nil, preparation_time: '2 hours', cooking_time: '2 hours', description: 'Test',
                        public: false, user_id: @user.id)
    expect(recipe).to_not be_valid
  end
  it 'recipe should not be valid without cooking time' do
    recipe = Recipe.new(name: 'Pizza', preparation_time: '2 hours', cooking_time: nil, description: 'Test',
                        public: false, user_id: @user.id)
    expect(recipe).to_not be_valid
  end
  it 'recipe should not be valid without preparation time' do
    recipe = Recipe.new(name: 'Pizza', preparation_time: nil, cooking_time: '2 hours', description: 'Test',
                        public: false, user_id: @user.id)
    expect(recipe).to_not be_valid
  end
  it 'recipe should not be valid without a description' do
    recipe = Recipe.new(name: 'Pizza', preparation_time: '2 hours', cooking_time: '2 hours',
                        description: nil, public: false, user_id: @user.id)
    expect(recipe).to_not be_valid
  end
end
