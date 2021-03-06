# frozen_string_literal: true

DEFAULT_SPACE_NAME = 'Modest Family Home'
DEFAULT_SPACE_DESCRIPTION = 'Two up, two down, heinously overpriced. Property is theft.'
DEFAULT_SPACE_PRICE = '5.20'
DEFAULT_EMAIL = 'test@test.com'
DEFAULT_START_DATE = "01/01/21"
DEFAULT_END_DATE = "06/07/21"

DEFAULT_BOOKING_DATE = "20/03/21"

DEFAULT_USER_NAME = 'John Wayne'
DEFAULT_USER_EMAIL = 'test@test.com'
DEFAULT_USER_PASSWORD = 'goodbadugly'

SECOND_USER_NAME = 'Clint Eastwood'
SECOND_USER_EMAIL = "clint@eastwood.com"
SECOND_USER_PASSWORD = "mysteryman"


def fill_in_space_form(space_name = DEFAULT_SPACE_NAME,
                      space_description = DEFAULT_SPACE_DESCRIPTION,
                      space_price = DEFAULT_SPACE_PRICE,
                      start_date = DEFAULT_START_DATE,
                      end_date = DEFAULT_END_DATE)
  fill_in :space_name, with: space_name
  fill_in :description, with: space_description
  fill_in :price, with: space_price
  fill_in :start_date, with: start_date
  fill_in :end_date, with: end_date
  attach_file('image_file', 'public/default_space_image.png')
end

def direct_add_space_to_db(space_name = DEFAULT_SPACE_NAME,
                           space_description = DEFAULT_SPACE_DESCRIPTION,
                           space_price = DEFAULT_SPACE_PRICE)
  space = Space.new(space_name: space_name,
                    description: space_description,
                    price: space_price)
  space.save
  space
end

def register_new_user(user_name = DEFAULT_USER_NAME, user_email = DEFAULT_USER_EMAIL, user_password = DEFAULT_USER_PASSWORD)
  visit '/'
  click_on 'Register'
  fill_in :user_name, with: user_name
  fill_in :user_email, with: user_email
  fill_in :password, with: user_password
  click_button 'Save'
end

def sign_in(user_email = DEFAULT_USER_EMAIL, user_password = DEFAULT_USER_PASSWORD)
  click_on 'Sign In'

  fill_in :user_email, with: user_email
  fill_in :password, with: user_password
  click_button 'Sign In'
end

def sign_out
  visit '/'
  click_on "Sign Out"
end
