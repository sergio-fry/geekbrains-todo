require 'rails_helper'

RSpec.feature "Menus", type: :feature do
  scenario "User open site and click menu" do
    visit "/"

    click_on "Stats"

    expect(page).to have_text("Here is my stats")
  end
end
