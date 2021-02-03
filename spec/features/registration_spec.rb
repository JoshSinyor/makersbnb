feature 'user registration' do
  scenario 'user registers' do
    visit '/'
    click_button 'register'
    fill_in :user_name, with: DEFAULT_USER_NAME
    fill_in :user_email, with: DEFAULT_USER_EMAIL
    # fill_in :password, with: DEFAULT_USER_PASSWORD
    click_button 'save'
    
    user = Users.where(user_email: DEFAULT_USER_EMAIL).first
    expect(user.user_name).to eq DEFAULT_USER_NAME
  end
end
