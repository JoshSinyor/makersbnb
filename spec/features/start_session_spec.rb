# frozen_string_literal: true

feature 'starting session' do
  scenario 'welcomed by name after session start' do
    visit '/'
    register_new_user(DEFAULT_USER_NAME, DEFAULT_USER_EMAIL, DEFAULT_USER_PASSWORD)

    click_on 'Sign In'
    expect(current_path).to eq '/sign_in'
    fill_in :user_email, with: DEFAULT_USER_EMAIL
    fill_in :password, with: DEFAULT_USER_PASSWORD
    click_button 'Sign In'

    expect(current_path).to eq '/'
    expect(page).to have_content "Welcome Big #{DEFAULT_USER_NAME[0]}!"
  end
end
