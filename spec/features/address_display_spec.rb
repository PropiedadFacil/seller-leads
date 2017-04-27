feature 'Locate address step' do
  xit scenario 'User submits a formatted address' do
    visit "/locate"
    fill_in "Name", :with => "My Widget"
    click_button "Create Widget"

    expect(page).to have_text("Widget was successfully created.")
  end
end
