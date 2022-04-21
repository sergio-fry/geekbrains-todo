require 'rails_helper'

RSpec.describe "newone/index.html.slim", type: :view do
  before { render }
  xit { expect(rendered).to match(/text/) }
end
