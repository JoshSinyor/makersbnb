# frozen_string_literal: true

feature 'Homepage' do
  # RSpec feature tests do not currently respect 'required' fields.
  before do
    visit '/'
  end

  scenario 'page displays multiple listings' do
    direct_add_space_to_db(DEFAULT_SPACE_NAME, DEFAULT_SPACE_DESCRIPTION, DEFAULT_SPACE_PRICE, DEFAULT_EMAIL)
    direct_add_space_to_db('Windsor Castle', 'Bring back the guillotine.', '6.25', 'liz@saxe-coburgs.de')
    visit '/'

    expect(page).to have_content DEFAULT_SPACE_NAME
    expect(page).to have_content 'Windsor Castle'
  end

  scenario "enter space form is now on a separate page" do
    # visit "/"
    register_new_user(DEFAULT_USER_NAME, DEFAULT_USER_EMAIL, DEFAULT_USER_PASSWORD)
    sign_in
    click_button "Add your space"

    expect(current_path).to eq "/new_space"
  end
end
