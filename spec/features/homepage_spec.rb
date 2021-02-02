# frozen_string_literal: true
# Home page feature test
feature 'HomePage' do
  scenario 'user visits homepage' do
    visit('/')
    expect(page).to have_content 'Makers BnB'
  end

  scenario 'user adds listing' do
    visit('/')
    fill_in :name, with: 'space'
    fill_in :description, with: 'a space'
    fill_in :price, with: '£1.00'
    click_button :submit
    expect(page).to have_content 'space a space £1.00'
  end
end
