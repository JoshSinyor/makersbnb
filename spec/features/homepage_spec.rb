# frozen_string_literal: true

feature 'Homepage' do
  # RSpec feature tests do not currently respect 'required' fields.
  scenario 'user adds listing' do
    fill_in_form(DEFAULT_SPACE_NAME, DEFAULT_SPACE_DESCRIPTION, DEFAULT_SPACE_PRICE, DEFAULT_EMAIL)
    click_button "Submit"

    expect(page).to have_content DEFAULT_SPACE_NAME
    expect(page).to have_content DEFAULT_SPACE_DESCRIPTION
    expect(page).to have_content DEFAULT_SPACE_PRICE
    expect(page).to have_content DEFAULT_EMAIL
  end

  scenario 'user inputs email address' do
    fill_in_form(DEFAULT_SPACE_NAME, DEFAULT_SPACE_DESCRIPTION, DEFAULT_SPACE_PRICE, DEFAULT_EMAIL)
    click_button "Submit"

    expect(page).to have_content DEFAULT_EMAIL
  end

  scenario "user can specify available dates" do
    fill_in_form(DEFAULT_SPACE_NAME, DEFAULT_SPACE_DESCRIPTION, DEFAULT_SPACE_PRICE, DEFAULT_EMAIL)
    fill_in "start_date", with: "02/01/21"
    fill_in "end_date", with: "05/07/21"
    click_button "Submit"

    expect(page).to have_content "This space is available from 02/01/21 to 05/07/21. Book now!"
  end

  scenario 'page displays multiple listings' do
    fill_in_form(DEFAULT_SPACE_NAME, DEFAULT_SPACE_DESCRIPTION, DEFAULT_SPACE_PRICE, DEFAULT_EMAIL)
    click_button "Submit"
    fill_in_form('Windsor Castle', 'Bring back the guillotine.', '6.25', 'liz@saxe-coburgs.de')
    click_button "Submit"

    expect(page).to have_content DEFAULT_SPACE_NAME
    expect(page).to have_content 'Windsor Castle'
  end
end
