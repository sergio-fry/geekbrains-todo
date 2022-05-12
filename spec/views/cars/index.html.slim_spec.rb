require 'rails_helper'

RSpec.describe "cars/index", type: :view do
  before(:each) do
    assign(:cars, [
      Car.create!(
        model: "Model",
        owner: "Owner"
      ),
      Car.create!(
        model: "Model",
        owner: "Owner"
      )
    ])
  end

  it "renders a list of cars" do
    render
    assert_select "tr>td", text: "Model".to_s, count: 2
    assert_select "tr>td", text: "Owner".to_s, count: 2
  end
end
