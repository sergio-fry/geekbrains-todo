require "rails_helper"

RSpec.describe "stats routing", type: :routing do
  it do
    expect(get: "stats/index").to route_to(
      controller: "stats",
      action: "index"
    )
  end
end
