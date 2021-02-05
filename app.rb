# frozen_string_literal: true

require 'sinatra'
require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'sinatra/flash'
require 'bcrypt'
require './lib/space'
require './lib/user'
require './lib/booking'

# MakersBNBapp is the controller.
class MakersBNBapp < Sinatra::Base
  enable :sessions
  register Sinatra::ActiveRecordExtension
  register Sinatra::Flash
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @spaces = Space.all
    @login_status = session[:session_user]
    erb :index
  end

  get '/new_space' do
    if session[:session_user]
      erb :new_space
    else
      flash[:not_signed_in] = "You must be signed in to add a space."
      redirect '/sign_in'
    end
  end

  post '/new_space' do
    # saving the image file
    if params[:image_file]
      filename = params[:image_file][:filename]
      file = params[:image_file][:tempfile]
      path = "./public/uploads/#{filename}"

      File.open(path, 'wb') { |f| f.write(file.read) }
    end

    space = Space.new(space_name: params['space_name'],
                      description: params['description'],
                      price: params['price'],
                      start_date: params['start_date'],
                      end_date: params['end_date'],
                      user_id: session[:session_user].id,
                      image_name: params['image_file'][:filename])
    space.save


    redirect '/'
  end

  get '/listing-:id' do
    @login_status = session[:session_user]
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

    booking = Booking.new(start_date: params['date'],
                          space_id: session[:space_id],
                          user_id: session[:session_user].id,
                          accepted: false)

    booking.save
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
      session[:session_user] = user
      redirect '/'
    else
      flash[:email_in_use] = "This email has already been registered."
      redirect '/register'
    end
  end

  get '/sign_in' do
    erb :sign_in
  end

  post '/sign_in' do
    user = User.where(user_email: params['user_email'].downcase).first
    if !user.nil? && user.authenticate(params['password'])
      session[:session_user] = user
      redirect '/'
    else
      flash[:invalid_credentials] = "Invalid email/password combination"
      redirect '/sign_in'
    end
  end

  get '/sign_out' do
    session[:session_user] = nil
    redirect '/'
  end

  get "/my_spaces" do
    @spaces = Space.where(user_id: session[:session_user].id)
    p @spaces
    erb :my_spaces
  end

end
