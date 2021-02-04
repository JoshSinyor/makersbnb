feature "booking a space" do

  before do
    visit '/'
    register_new_user(DEFAULT_USER_NAME, DEFAULT_USER_EMAIL, DEFAULT_USER_PASSWORD)
    sign_in
    click_on 'Add Your Space'
    fill_in_space_form(DEFAULT_SPACE_NAME, DEFAULT_SPACE_DESCRIPTION, DEFAULT_SPACE_PRICE, DEFAULT_USER_EMAIL)
    click_button 'Submit'
    sign_out
    register_new_user(SECOND_USER_NAME, SECOND_USER_EMAIL, SECOND_USER_PASSWORD)
    sign_in(SECOND_USER_EMAIL, SECOND_USER_PASSWORD)
  end

  scenario "user can enter a date they want to book for" do
    click_on DEFAULT_SPACE_NAME
    fill_in "date", with: DEFAULT_BOOKING_DATE
    click_button "Request Booking"

    expect(page).to have_content "Booking request accepted."
    expect(page).to have_content "#{DEFAULT_USER_NAME} will check this soon."
  end

end
