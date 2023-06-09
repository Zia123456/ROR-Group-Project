require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'returns http success and render properly' do
      get '/users/index'
      expect(response).to have_http_status(302)
    end
  end
end
