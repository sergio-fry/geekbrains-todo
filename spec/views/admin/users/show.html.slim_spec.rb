require 'rails_helper'

RSpec.describe "admin/users/show", type: :view do
  before(:each) do
    @admin_user = assign(:admin_user, Admin::User.create!(
      name: "Name",
      email: "Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Email/)
  end
end
