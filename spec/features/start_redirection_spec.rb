feature 'From Home, redirects to start after the user' do
  before(:each) { visit root_path }

  # Reusing the same expectation after each scenario
  after(:each) { expect(page).to have_text('Please enter your address') }

  scenario 'clicks GET STARTED header button' do
    within('ul.navbar-nav') do
      click_link 'Get Started'
    end
  end

  scenario "clicks the 'Get your cash offer today' button inside the first block" do
    within('.block-xs-middle.pb-5') do
      find('.btn.btn-success.btn-lg').click
    end
  end

  scenario "clicks the 'Get Started' button in the agent introduction block" do
    within('.block.block-secondary.app-iphone-block') do
      find('.btn.btn-success').click
    end
  end

  scenario "clicks the 'Get your cash offer today' button inside the pricing block" do
    within('.block.app-price-plans') do
      find('.btn.btn-success.btn-lg').click
    end
  end
end
