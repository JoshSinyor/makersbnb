# frozen_string_literal: true

require 'space'

describe Space do
  it 'adds a space to the database' do
    space = Space.new(space_name: DEFAULT_SPACE_NAME,
                      description: DEFAULT_SPACE_DESCRIPTION,
                      price: DEFAULT_SPACE_PRICE)
    space.save

    space = Space.where(price: DEFAULT_SPACE_PRICE).first
    expect(space.space_name).to eq DEFAULT_SPACE_NAME
  end
end
