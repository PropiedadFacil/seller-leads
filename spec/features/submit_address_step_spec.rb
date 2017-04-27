feature 'Submit address step' do
  before(:each) do
    visit '/start'
  end

  scenario 'User submits a formatted address' do
    fill_in "address", with: '7331 E Bonita Dr, Scottsdale'
    click_button "Find my home"

    expect(page).to have_text("Is this the correct address?")
  end

end
