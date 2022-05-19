require 'rails_helper'

RSpec.describe StatsController, type: :controller do
  describe "GET /index" do
    before { sign_in create(:user) }
    it "check index" do
      get :index
      expect(response).to render_template('stats/index')
    end
  end
end

