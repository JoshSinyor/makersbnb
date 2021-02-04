# frozen_string_literal: true

feature 'New Space' do
  before do
    visit '/'
    click_on 'Add Your Space'
    fill_in_space_form(DEFAULT_SPACE_NAME, DEFAULT_SPACE_DESCRIPTION, DEFAULT_SPACE_PRICE, DEFAULT_EMAIL)
  end
  # RSpec feature tests do not currently respect 'required' fields.
  scenario 'user adds listing' do
    click_button 'Submit'

    expect(page).to have_content DEFAULT_SPACE_NAME
    expect(page).to have_content DEFAULT_SPACE_DESCRIPTION
    expect(page).to have_content DEFAULT_SPACE_PRICE
    expect(page).to have_content DEFAULT_EMAIL
  end

  scenario 'user can specify available dates' do
    fill_in 'start_date', with: '02/01/21'
    fill_in 'end_date', with: '05/07/21'
    click_button 'Submit'

    expect(page).to have_content 'This space is available from 02/01/21 to 05/07/21. Book now!'
  end
end
