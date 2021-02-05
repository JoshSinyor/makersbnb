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

@users = []

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
