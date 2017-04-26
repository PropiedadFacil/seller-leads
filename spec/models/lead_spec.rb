require 'rails_helper'

describe Lead do
  it 'has a valid lead_factory' do
    lead = FactoryGirl.build(:lead)
    expect(lead).to be_valid
  end

  it 'is invalid without bedrooms' do
    lead = FactoryGirl.build(:lead, bedrooms: nil)
    expect(lead).to be_invalid
  end
  it 'is invalid without bathrooms' do
    lead = FactoryGirl.build(:lead, bathrooms: nil)
    expect(lead).to be_invalid
  end
  it 'is invalid without address' do
    lead = FactoryGirl.build(:lead, address: nil)
    expect(lead).to be_invalid
  end

  it 'is invalid without lat' do
    lead = FactoryGirl.build(:lead, lat: nil)
    expect(lead).to be_invalid
  end
  it 'is invalid without lng' do
    lead = FactoryGirl.build(:lead, lng: nil)
    expect(lead).to be_invalid
  end
  it 'is invalid without built_surface' do
    lead = FactoryGirl.build(:lead, built_surface: nil)
    expect(lead).to be_invalid
  end
  it 'is invalid without a Customer' do
    lead = FactoryGirl.build(:lead, user_id: nil)
    expect(lead).to be_invalid
  end

end
