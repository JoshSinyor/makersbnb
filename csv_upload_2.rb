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

@file = CSV.read('public/loremipsum.csv')
@file = @file.join
@file = @file.split(". ")
@file.map! { |element| element = "#{element}." }
@holding = []

itr = 0

@file.each do |element|
  if element.length <= 150
    @price = [100..500].sample
    @space_description = element
    @user_id = [1..20].sample
    @start_date = "01/01/20"
    @end_date = "31/12/20"
  else
    next
  end

  space = Space.new(space_name: "Space #{itr}",
                    description: @space_description,
                    user_id: @user_id,
                    price: @price,
                    start_date: @start_date,
                    end_date: @end_date)
  space.save
end
