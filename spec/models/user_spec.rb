require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create :user }

  it { expect(user.persisted?).to eq true }

  it { expect(user).to be_persisted }


  # 1. write failing test
  # 2. make green
  # 3. refactor

  describe '#fancy_role' do
    let(:user) { build :user }
    it { expect(user.fancy_role).to eq "Fancy role 'user'" }
  end

  describe 'email' do

    it "create multiple" do
      user1 = create :user
      user2 = create :user

      expect(user1).to be_persisted
      expect(user2).to be_persisted
    end
  end

  context do
    let(:user) { create :user }
    let(:admin) { create :user, :admin }

    it { expect(user.role.code).to eq 'user' }
    it { expect(admin.role.code.to_sym).to eq :admin }
  end

  describe 'associations' do
    it { should have_one(:profile) }
  end
end
