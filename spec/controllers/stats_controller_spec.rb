require 'rails_helper'

RSpec.describe StatsController, type: :controller do
  describe "GET /index" do
    it "check index" do
      get :index
      expect(response).to render_template('stats/index')
    end
  end
end

