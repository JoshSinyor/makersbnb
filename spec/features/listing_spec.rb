# frozen_string_literal: true

feature 'Listing' do
  scenario 'listing has a page' do
    space = direct_add_space_to_db(DEFAULT_SPACE_NAME, DEFAULT_SPACE_DESCRIPTION, DEFAULT_SPACE_PRICE, DEFAULT_EMAIL)
    visit('/')
    click_on DEFAULT_SPACE_NAME # We would rather reference this by id

    expect(current_path).to eq "/listing-#{space.id}"
    expect(page.status_code).to eq 200 # Is this necessary when the path will be 404 if it doesn't equal 200?
  end

  scenario 'listings page has listing content' do
    direct_add_space_to_db(DEFAULT_SPACE_NAME, DEFAULT_SPACE_DESCRIPTION, DEFAULT_SPACE_PRICE, DEFAULT_EMAIL)
    # The variable 'space' does not need to be assigned unless we are referencing by id
    visit('/')
    click_on DEFAULT_SPACE_NAME # We would rather reference this by id

    expect(page).to have_content DEFAULT_SPACE_NAME
    expect(page).to have_content DEFAULT_SPACE_DESCRIPTION
    expect(page).to have_content DEFAULT_SPACE_PRICE
    expect(page).to have_content DEFAULT_EMAIL
  end
end
