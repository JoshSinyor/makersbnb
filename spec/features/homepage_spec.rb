# frozen_string_literal: true

feature 'Homepage' do
  # RSpec feature tests do not currently respect 'required' fields.
  before do
    visit '/'
  end

  scenario 'page displays multiple listings' do
    direct_add_space_to_db
    direct_add_space_to_db('Windsor Castle', 'Bring back the guillotine.', '6.25')
    visit '/'

    expect(page).to have_content DEFAULT_SPACE_NAME
    expect(page).to have_content 'Windsor Castle'
  end

  scenario "enter space form is now on a separate page" do
    register_new_user
    click_on "Add Your Space"

    expect(current_path).to eq "/new_space"
  end
end
