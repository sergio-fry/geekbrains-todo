require 'rails_helper'

RSpec.describe 'Newones', type: :request do
  describe 'GET /index' do
    before { sign_in create(:user) }
    it 'returns http success' do
      get '/newone/index'
      expect(response).to have_http_status(:success)
    end
  end
end
