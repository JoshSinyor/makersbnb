# frozen_string_literal: true

feature 'starting session' do
  scenario 'welcomed by name after session start' do
    visit '/'
    register_new_user

    expect(current_path).to eq '/'
    expect(page).to have_content "Welcome Big #{DEFAULT_USER_NAME[0]}!"
  end
end
