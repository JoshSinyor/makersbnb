feature "my spaces page" do

  before do
    visit '/'
    register_new_user
    click_on 'Add Your Space'
    fill_in_space_form
    click_button 'Submit'
  end

  scenario "user is able to see their own space" do
    click_on "My Spaces"

    expect(current_path).to eq "/my_spaces"
    expect(page).to have_content DEFAULT_SPACE_NAME
  end

  scenario "user can see if their space has been requested" do
    sign_out

    register_new_user(SECOND_USER_NAME, SECOND_USER_EMAIL, SECOND_USER_PASSWORD)
    click_on DEFAULT_SPACE_NAME
    fill_in "date", with: DEFAULT_BOOKING_DATE
    click_button "Request Booking"
    sign_out

    sign_in
    click_on "My Spaces"
    expect(page).to have_content("This space has been requested.")
  end

# One place we should see if space is requested

end
