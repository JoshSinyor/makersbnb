# frozen_string_literal: true

DEFAULT_SPACE_NAME = 'Modest Family Home'
DEFAULT_SPACE_DESCRIPTION = 'Two up, two down, heinously overpriced. Property is theft.'
DEFAULT_SPACE_PRICE = '5.20'
DEFAULT_EMAIL = 'test@test.com'

def add_one_space(space_name, space_description, space_price, space_email)
  visit '/'
  fill_in :name, with: space_name
  fill_in :description, with: space_description
  fill_in :price, with: space_price
  fill_in :email, with: space_email
  click_button :submit
end

def direct_add_space_to_db
  space = Space.new(space_name: DEFAULT_SPACE_NAME,
                    description: DEFAULT_SPACE_DESCRIPTION,
                    price: DEFAULT_SPACE_PRICE,
                    email: DEFAULT_EMAIL)
  space.save
  space
end
