feature 'Signing out' do
  scenario 'a user signs in then out' do
    register_new_user(DEFAULT_USER_NAME, DEFAULT_USER_EMAIL, DEFAULT_USER_PASSWORD)

    click_on 'Sign In'
    expect(current_path).to eq '/sign_in'
    fill_in :user_email, with: DEFAULT_USER_EMAIL
    fill_in :password, with: DEFAULT_USER_PASSWORD
    click_button 'Sign In'

    click_on 'Sign Out'
    expect(page.status_code).to eq 200
    expect(page).not_to have_content "Welcome Big #{DEFAULT_USER_NAME[0]}!"
  end
end
