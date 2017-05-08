feature 'User signs in with FB Oauth' do
  before(:each) do
    set_oauth
    set_step5
  end

  scenario 'Successfully' do
    visit '/wizard/step4'
    expect(page).to have_text('Continue with Facebook')
    click_link 'Continue with Facebook'
    expect(page).to have_text('Last Step!')
  end
end
