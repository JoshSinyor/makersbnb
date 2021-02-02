# frozen_string_literal: true

# Home page feature test
feature 'HomePage' do

# RSpec feature tests do not currently respect 'required' fields.

  scenario 'user adds listing' do
    add_one_space(DEFAULT_SPACE_NAME, DEFAULT_SPACE_DESCRIPTION, DEFAULT_SPACE_PRICE, DEFAULT_EMAIL)

    expect(page).to have_content DEFAULT_SPACE_NAME
    expect(page).to have_content DEFAULT_SPACE_DESCRIPTION
    expect(page).to have_content DEFAULT_SPACE_PRICE
    expect(page).to have_content DEFAULT_EMAIL
  end

  scenario "user inputs email address" do
    visit '/'
    fill_in :name, with: DEFAULT_SPACE_NAME
    fill_in :description, with: DEFAULT_SPACE_DESCRIPTION
    fill_in :price, with: DEFAULT_SPACE_PRICE
    fill_in :email, with: DEFAULT_EMAIL
    click_button :submit

    expect(page).to have_content DEFAULT_EMAIL
  end

  scenario 'page displays multiple listings' do
    add_one_space(DEFAULT_SPACE_NAME, DEFAULT_SPACE_DESCRIPTION, DEFAULT_SPACE_PRICE, DEFAULT_EMAIL)
    add_one_space('Windsor Castle', 'Bring back the guillotine.', '6.25', 'liz@saxe-coburgs.de')

    expect(page).to have_content DEFAULT_SPACE_NAME
    expect(page).to have_content 'Windsor Castle'
  end
end
