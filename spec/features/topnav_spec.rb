# frozen string literal: true

feature 'Topnav bar' do
  before do
    visit '/'
  end

  scenario 'user is not signed in' do
    expect(page).to have_selector(:link_or_button, 'Sign In')
    expect(page).to have_selector(:link_or_button, 'Register')
    expect(page).not_to have_selector(:link_or_button, 'Sign Out')
  end

  scenario 'user is signed in' do
    register_new_user

    expect(page).to have_selector(:link_or_button, 'Sign Out')
    expect(page).not_to have_selector(:link_or_button, 'Sign In')
    expect(page).not_to have_selector(:link_or_button, 'Register')
  end
end
