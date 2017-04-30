feature 'User submits' do
  before(:each) do
    visit '/wizard/step1'
  end

  scenario 'a properly formatted address' do
    find('#lead_wizard_address').set('7331 E Bonita Dr, Scottsdale')
    click_button 'Find my home'

    expect(page).to have_text('Is this the correct address?')
  end

  scenario 'an incomplete address' do
    find('#lead_wizard_address').set('7331 e bonita dr')
    click_button 'Find my home'

    expect(page).to have_text("Let's get started")
    # TODO: Must test for an error message too,
    #       indicating that the address is incomplete
  end

  scenario 'an empty field' do
    find('#lead_wizard_address').set('')
    click_button 'Find my home'

    expect(page).to have_text("Let's get started")
    # TODO: Must test for an error message too,
    #       indicating that the address is missing
  end
end
