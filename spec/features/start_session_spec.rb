# frozen_string_literal: true

feature "starting session" do 

  scenario "welcomed by name after session start" do
    visit "/"
    click_button "register"

    fill_in :user_name, with: DEFAULT_USER_NAME
    fill_in :user_email, with: DEFAULT_USER_EMAIL
    fill_in :password, with: DEFAULT_USER_PASSWORD
    click_button 'save'

    expect(current_path).to eq "/"
    expect(page).to have_content DEFAULT_USER_NAME
  end


end
