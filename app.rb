# frozen_string_literal: true

require 'sinatra'
require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'bcrypt'
require './lib/space'
require './lib/user'

# MakersBNBapp is the controller.
class MakersBNBapp < Sinatra::Base
  enable :sessions
  register Sinatra::ActiveRecordExtension
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @spaces = Space.all
    @login_status = session[:session_user]
    erb :index
  end

  get '/new_space' do
    erb :new_space
  end

  post '/new_space' do
    space = Space.new(space_name: params['space_name'],
                      description: params['description'],
                      price: params['price'],
                      email: params['email'],
                      start_date: params['start_date'],
                      end_date: params['end_date'],
                    user_id: session[:session_user].id)
    space.save
    redirect '/'
  end

  get '/listing-:id' do
    @booking = session[:booking_requested]
    if params[:id] == ":id"
      params[:id] = session[:listing_id]
    end

    @space = Space.where(id: params[:id])[0]
    @owner = User.find(@space.user_id)
    erb :listing
  end

  post '/listing-:id' do
    session[:booking_requested] = true
    session[:listing_id] = params[:id]
    redirect '/listing-:id'
  end

  get '/register' do
    erb :register
  end

  post '/new_user' do
    encrypted_password = BCrypt::Password.create(params[:password])
    user = User.new(user_name: params['user_name'],
                    user_email: params['user_email'].downcase,
                    password_digest: encrypted_password)
    if user.save
      redirect '/'
    else
      redirect '/register'
    end
  end

  get '/sign_in' do
    erb :sign_in
  end

  post '/sign_in' do
    user = User.where(user_email: params['user_email'].downcase).first
    if user.authenticate(params['password'])
      session[:session_user] = user
      redirect '/'
    else
      redirect '/sign_in'
    end
  end

  get '/sign_out' do
    session[:session_user] = nil
    redirect '/'
  end
end
