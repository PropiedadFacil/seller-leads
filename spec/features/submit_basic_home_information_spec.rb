require 'spec_helper'

feature 'Step 3' do
  before(:each) do
    session = {
      lead_attributes: {
        address: '7331 E Bonita Dr, Scottsdale',
        lat: 39.123123,
        lng: -123.1234
      }
    }
    page.set_rack_session(session)
    visit '/wizard/step3'
  end

  scenario 'Submits nothing' do
    click_button 'Next'
    expect(page).to have_text('Where should we send your offer?')
  end

  scenario 'Submits a partially filled form' do
    page.fill_in 'Bedrooms', with: 3
    page.fill_in 'Bathrooms', with: 3
    page.fill_in 'How big is your home?', with: '1000 sqft'
    click_button 'Next'
    expect(page).to have_text('Where should we send your offer?')
  end

  scenario 'Submits a complete form' do
    page.fill_in 'Bedrooms', with: 3
    page.fill_in 'Bathrooms', with: 3
    page.fill_in 'How big is your home?', with: '1000 sqft'
    # Pool type
    page.choose('lead_wizard_pool_type_in_ground')
    # How would you rate the condition of your kitchen?
    page.choose('lead_wizard_kitchen_condition_great_kitchen') # Great
    # How would you rate the condition of your bathrooms?
    page.choose('lead_wizard_bathroom_condition_great_bathroom') # Great

    click_button 'Next'
    expect(page).to have_text('Where should we send your offer?')
  end

end
