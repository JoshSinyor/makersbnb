# frozen_string_literal: true

feature 'listing' do
  scenario "takes us to a listing's page" do
    space = direct_add_space_to_db
    visit('/')
    click_on DEFAULT_SPACE_NAME # We would rather reference this by id

    expect(current_path).to eq "/listing-#{space.id}"
    expect(page.status_code).to eq 200 # Is this necessary when the path will be 404 if it doesn't equal 200?
  end
end