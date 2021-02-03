# frozen_string_literal: true

DEFAULT_SPACE_NAME = 'Modest Family Home'
DEFAULT_SPACE_DESCRIPTION = 'Two up, two down, heinously overpriced. Property is theft.'
DEFAULT_SPACE_PRICE = '5.20'
DEFAULT_EMAIL = 'test@test.com'

DEFAULT_USER_NAME = 'John Wayne'
DEFAULT_USER_EMAIL = 'john@wildwest.com'
DEFAULT_USER_PASSWORD = 'goodbadugly'

def fill_in_form(space_name, space_description, space_price, space_email)
  visit '/'
  fill_in :name, with: space_name
  fill_in :description, with: space_description
  fill_in :price, with: space_price
  fill_in :email, with: space_email
end

def direct_add_space_to_db
  space = Space.new(space_name: DEFAULT_SPACE_NAME,
                    description: DEFAULT_SPACE_DESCRIPTION,
                    price: DEFAULT_SPACE_PRICE,
                    email: DEFAULT_EMAIL)
  space.save
  space
end

def register_new_user(user_name, user_email, user_password)
  visit '/'
  click_button 'register'
  fill_in :user_name, with: user_name
  fill_in :user_email, with: user_email
  fill_in :password, with: user_password
  click_button 'save'
end
