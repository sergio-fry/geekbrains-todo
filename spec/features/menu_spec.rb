require 'rails_helper'

RSpec.feature "Menus", type: :feature do
  let(:user) { create :user }
  scenario "User open site and click menu" do
    sign_in user
    visit "/"

    click_on "Stats"

    expect(page).to have_text("Here is my stats")
  end
end
