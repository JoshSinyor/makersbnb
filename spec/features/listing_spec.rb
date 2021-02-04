# frozen_string_literal: true

feature 'Listing' do
  before do
    visit '/'
    register_new_user(DEFAULT_USER_NAME, DEFAULT_USER_EMAIL, DEFAULT_USER_PASSWORD)
    click_on 'Add Your Space'
    fill_in_space_form(DEFAULT_SPACE_NAME, DEFAULT_SPACE_DESCRIPTION, DEFAULT_SPACE_PRICE, DEFAULT_EMAIL, DEFAULT_START_DATE, DEFAULT_END_DATE)
    click_button 'Submit'
  end

  scenario 'listings page has listing content' do
    click_on DEFAULT_SPACE_NAME # We would rather reference this by id

    expect(page).to have_content DEFAULT_SPACE_NAME
    expect(page).to have_content DEFAULT_SPACE_DESCRIPTION
    expect(page).to have_content DEFAULT_SPACE_PRICE
    expect(page).to have_content DEFAULT_EMAIL
  end
end
