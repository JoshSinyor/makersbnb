# frozen_string_literal = true

DEFAULT_SPACE_NAME = 'Modest Family Home'
DEFAULT_SPACE_DESCRIPTION = 'Two up, two down, heinously overpriced. Property is theft.'
DEFAULT_SPACE_PRICE = '5.20'

def add_one_space(space_name, space_description, space_price)
  visit('/')
  fill_in :name, with: space_name
  fill_in :description, with: space_description
  fill_in :price, with: space_price
  click_button :submit
end
