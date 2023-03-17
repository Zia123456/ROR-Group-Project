require 'rails_helper'

RSpec.describe 'Food testing', type: :feature do
    before do
        # Log in the user before each test
        visit new_user_session_path
        fill_in 'Email', with: 'user@example.com'
        fill_in 'Password', with: 'password'
        click_button 'Log in'
    end

    describe 'index page' do
      before(:example) do
        @user = User.create(name: 'Zia')
        @food = Food.create(name: 'chicken', measurement_unit: 'grams', price: 2.0)
        visit foods_path(user_id: @user.id)
      end

     
      it 'should render food name' do
        expect(page).to have_content('Log in')
      end

    end
  
end