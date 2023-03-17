require 'rails_helper'

RSpec.describe 'Controllers', type: :request do
  describe 'GET #index' do
    let(:user) { User.create(name: 'Zia') }
    before(:example) { get foods_path(user) } # get(:index)
    it 'should redirect to another url' do
        expect(response).to have_http_status(302)
    end
    it "index redirected to sign-in" do
        expect(response).to redirect_to('http://www.example.com/users/sign_in')
    end
  end

  describe 'GET #new' do
    let(:user) { User.create(name: 'Zia') }
    let(:food) do
      Food.create(name: 'chicken', measurement_unit: 'grams',price: 10.0)
    end

    before(:example) { get new_food_path(user, food) } # get(:new)
    it 'should redirect to another url' do
        expect(response).to have_http_status(302)
    end
    it "index redirected to sign-in" do
        expect(response).to redirect_to('http://www.example.com/users/sign_in')
    end
  end
end
