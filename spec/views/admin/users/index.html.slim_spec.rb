require 'rails_helper'

RSpec.describe "admin/users/index", type: :view do
  before(:each) do
    assign(:admin_users, [
      Admin::User.create!(
        name: "Name",
        email: "Email"
      ),
      Admin::User.create!(
        name: "Name",
        email: "Email"
      )
    ])
  end

  it "renders a list of admin/users" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Email".to_s, count: 2
  end
end
