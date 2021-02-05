require 'sinatra'
require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'sinatra/flash'
require 'bcrypt'
require 'csv'
require './lib/space'
require './lib/user'
require './lib/booking'

@file = CSV.read('public/user_pfps/chitterati.csv')

@file.each do |user|
  @id = user[0]
  @email = user[1]
  @password = user[2]
  @user_name = "#{user[3]} #{user[4]}"
  @pfp_url = user[6]

  encrypted_password = BCrypt::Password.create(@password)
  user = User.new(user_name: @user_name,
                  user_email: @email,
                  password_digest: encrypted_password,
                  pfp_url: @pfp_url)
  user.save
end

@property_names = [
  ['Leicester Square', 260, 'public/space_photos/leicester_square.jpg'],
  ['Fenchurch Street Station', 100, 'public/space_photos/fenchurch_street_station.jpg'],
  ['Whitechapel Road', 60, 'public/space_photos/whitechapel_road.jpg'],
  ['Mayfair', 400, 'public/space_photos/mayfair.jpg'],
  ['Pentonville Road', 120, 'public/space_photos/pentonville_road.jpg'],
  ['Electric Company', 150, 'public/space_photos/electric_company.jpg'],
  ['Trafalgar Square', 240, 'public/space_photos/trafalgar_square.jpg'],
  ['Fleet Street', 220, 'public/space_photos/fleet_street.jpg'],
  ['Strand', 220, 'public/space_photos/strand.jpg'],
  ['Piccadilly', 280, 'public/space_photos/piccadilly.jpg'],
  ['Old Kent Road', 60, 'public/space_photos/old_kent_road.jpg'],
  ['Vine Street', 200, 'public/space_photos/vine_street.jpg'],
  ['Oxford Street', 300, 'public/space_photos/oxford_street.jpg'],
  ['The Angel Islington', 100, 'public/space_photos/the_angel_islington.jpg'],
  ['Regent Street', 300, 'public/space_photos/regent_street.jpg'],
  ['Park Lane', 350, 'public/space_photos/park_lane.jpg'],
  ['Bond Street', 320, 'public/space_photos/bond_street.jpg'],
  ['Marylebone Station', 100, 'public/space_photos/marylebone_station.jpg'],
  ['King’s Cross Station', 100, 'public/space_photos/king_s_cross_station.jpg'],
  ['Liverpool Street Station', 100, 'public/space_photos/liverpool_street_station.jpg'],
  ['Pall Mall', 140, 'public/space_photos/pall_mall.jpg'],
  ['Bow Street', 180, 'public/space_photos/bow_street.jpg'],
  ['Whitehall', 140, 'public/space_photos/whitehall.jpg'],
  ['Marlborough Street', 180, 'public/space_photos/marlborough_street.jpg'],
  ['Coventry Street', 260, 'public/space_photos/coventry_street.jpg'],
  ['Euston Road', 100, 'public/space_photos/euston_road.jpg'],
  ['Northumberland Avenue', 160, 'public/space_photos/northumberland_avenue.jpg'],
  ['Water Works', 150, 'public/space_photos/water_works.jpg'],
]

@property_names.each do |property|
  @space_name = property[0]
  @price = property[1]
  @user_id = (1 + rand(19)).to_i
  @start_date = '01/01/2021'
  @end_date ='31/12/2021'

  space = Space.new(space_name: @space_name,
                    description: 'Hello world!',
                    user_id: @user_id,
                    price: @price,
                    start_date: @start_date,
                    end_date: @end_date)
  space.save
end
