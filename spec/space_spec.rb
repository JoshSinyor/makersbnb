require 'space'

describe Space do

  it 'adds a space to the database' do
    space = Space.new(  "space_name": 'Buckingham Castle',
                "description": "The most compelling argument for abolishment of the monarchy.",
                "price": '10000' )
    space.save

    space = Space.where("price": "10000").first

    expect(space.space_name).to_eq 'Buckingham Castle'
  end
end
