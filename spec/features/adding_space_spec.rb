# frozen_string_literal: true

feature 'New Space' do
  before do
    visit '/'
    register_new_user
    click_on 'Add Your Space'

    fill_in_space_form
  end
  # RSpec feature tests do not currently respect 'required' fields.
  scenario 'user adds listing' do
    click_button 'Submit'

    expect(page).to have_content DEFAULT_SPACE_NAME
    expect(page).to have_content DEFAULT_SPACE_DESCRIPTION
    expect(page).to have_content DEFAULT_SPACE_PRICE
  end

  scenario 'user can specify available dates' do
    click_button 'Submit'

    expect(page).to have_content "This space is available from #{DEFAULT_START_DATE} to #{DEFAULT_END_DATE}. Book now!"
  end

  scenario 'space is linked to owner user' do
    click_button 'Submit'

    space = Space.all[0]
    user = User.all[0]
    expect(user.id).to eq space.user_id
  end

  # scenario 'owner user uploads an image' do
  #   # click_button 'Upload Image'
  #   attach_file('image_file', 'public/default_space_image.png')
  #   click_button 'Submit'

  #   visit '/'
  #   expect(page).to have_content('default_space_image.png')
  # end
end
