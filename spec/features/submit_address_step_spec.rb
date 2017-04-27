feature 'User submits' do
  before(:each) do
    visit '/start'
  end

  scenario 'a properly formatted address' do
    fill_in "address", with: '7331 E Bonita Dr, Scottsdale'
    click_button "Find my home"

    expect(page).to have_text("Is this the correct address?")
  end

  xit scenario 'an incomplete address' do
  end

  xit scenario 'an empty field' do
  end

end
