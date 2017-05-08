require 'rails_helper'

describe User do
  it 'has a valid factory' do
    user = FactoryGirl.build(:user)
    expect(user).to be_valid
  end
  it 'is invalid without a first name' do
    expect(FactoryGirl.build(:user, first_name: nil)).to be_invalid
  end
  it 'is invalid without a unique email' do
    user = FactoryGirl.create(:user)
    expect(FactoryGirl.build(:user, email: user.email)).to be_invalid
  end
  it 'is invalid without an email' do
    expect(FactoryGirl.build(:user, email: nil)).to be_invalid
  end
end
