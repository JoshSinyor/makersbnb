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
    if session[:session_user]
      @welcome = "Welcome Big #{session[:session_user].user_name[0]}!"
    else
      @welcome = "Real gangstas make an account!"
    end
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
    user = User.new(user_name: params['user_name'],
                    user_email: params['user_email'],
                    password_digest: encrypted_password)
    user.save
    redirect '/'
  end

  get '/sign_in' do
    erb :sign_in
  end

  post '/sign_in' do
    user = User.where("user_email": params["user_email"]).first
    if user.authenticate(params["password"])
      session[:session_user] = user
      redirect "/"
    else
      redirect "/sign_in"
    end
  end
end
