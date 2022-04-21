require 'rails_helper'

RSpec.describe User, type: :model do
  let(:role) { Role.find_by code: :user }
  let(:user) { User.create! name: "Ivan", role: role }

  it { expect(user.persisted?).to eq true }

  it { expect(user).to be_persisted }


  # 1. write failing test
  # 2. make green
  # 3. refactor

  describe '#fancy_role' do
    it { expect(user.fancy_role).to eq "Fancy role 'user'" }
  end
end
