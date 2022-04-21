require 'rails_helper'

RSpec.describe User, type: :model do
  before { @role = Role.find_by code: :user }
  before { @user = User.create! name: "Ivan", role: @role }

  it { expect(@user.persisted?).to eq true }
end
