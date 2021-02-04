feature "my spaces page" do

  before do
    visit '/'
    register_new_user(DEFAULT_USER_NAME, DEFAULT_USER_EMAIL, DEFAULT_USER_PASSWORD)
    click_on 'Add Your Space'
    fill_in_space_form(DEFAULT_SPACE_NAME, DEFAULT_SPACE_DESCRIPTION, DEFAULT_SPACE_PRICE, DEFAULT_USER_EMAIL)
    click_button 'Submit'
  end

  scenario "user is able to see their own space" do
    click_on "My Spaces"

    expect(current_path).to eq "/my_spaces"
    expect(page).to have_content DEFAULT_SPACE_NAME
  end

end
