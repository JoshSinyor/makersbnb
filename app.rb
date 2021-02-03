# frozen_string_literal: true

require 'sinatra'
require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'bcrypt'
require './lib/space'

# MakersBNBapp is the controller.
class MakersBNBapp < Sinatra::Base
  enable :sessions
  register Sinatra::ActiveRecordExtension
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @spaces = Space.all
    erb :index
  end

  post '/new_space' do
    space = Space.new(space_name: params['name'],
                      description: params['description'],
                      price: params['price'],
                      email: params['email'],
                      start_date: params['start_date'],
                      end_date: params['end_date'])
    space.save
    redirect '/'
  end

  get '/listing-:id' do
    @space = Space.where(id: params[:id])[0]
    erb :listing
  end

  get '/register' do
    erb :register
  end

  post '/new_user' do
    encrypted_password = BCrypt::Password.create(params[:password])
    user = User.new(user_name: params['name'],
                      user_email: params['email'],
                      password_digest: encrypted_password
                    )
    user.save
    redirect '/'
  end

end
