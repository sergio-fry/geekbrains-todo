require 'rails_helper'

RSpec.describe "admin/users/new", type: :view do
  before(:each) do
    assign(:admin_user, Admin::User.new(
      name: "MyString",
      email: "MyString"
    ))
  end

  it "renders new admin_user form" do
    render

    assert_select "form[action=?][method=?]", admin_users_path, "post" do

      assert_select "input[name=?]", "admin_user[name]"

      assert_select "input[name=?]", "admin_user[email]"
    end
  end
end
