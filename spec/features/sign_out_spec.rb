feature 'Signing out' do
  scenario 'a user signs in then out' do
    register_new_user

    click_on 'Sign Out'
    expect(page).not_to have_content "Welcome Big #{DEFAULT_USER_NAME[0]}!"
  end
end
