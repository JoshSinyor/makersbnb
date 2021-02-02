feature 'listing' do

  scenario 'takes us to listing page' do
    space = direct_add_space_to_db
    visit('/')
    click_link(DEFAULT_SPACE_NAME) #need to change to listing url ('/listing/#{space.id}')
    expect(page.status).to eq 200
    expect(current_path).to eq ("/listing/#{space.id}")
  end

end
