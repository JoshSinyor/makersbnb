# frozen string literal: true

feature 'Topnav bar' do
  before do
    visit '/'
  end

  scenario 'user is not signed in' do
    expect(page).to have_selector('Sign In')
    expect(page).to have_selector('Register')
    expect(page).not_to have_selector('Sign Out')
  end

  scenario 'user is signed in' do
    register_new_user(DEFAULT_USER_NAME, DEFAULT_USER_EMAIL, DEFAULT_USER_PASSWORD)
    sign_in(DEFAULT_USER_EMAIL, DEFAULT_USER_PASSWORD)

    expect(page).to have_selector('Sign Out')
    expect(page).not_to have_selector('Sign In')
    expect(page).not_to have_selector('Register')
  end
end
