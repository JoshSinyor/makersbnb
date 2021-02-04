# frozen_string_literal: true

feature 'Listing' do
  before do
    visit '/'
    register_new_user
    click_on 'Add Your Space'
    fill_in_space_form
    click_button 'Submit'
  end

  scenario 'listings page has listing content' do
    click_on DEFAULT_SPACE_NAME # We would rather reference this by id

    expect(page).to have_content DEFAULT_SPACE_NAME
    expect(page).to have_content DEFAULT_SPACE_DESCRIPTION
    expect(page).to have_content DEFAULT_SPACE_PRICE
  end
end
