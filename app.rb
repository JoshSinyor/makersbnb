# frozen_string_literal: true

require 'sinatra'
require 'sinatra/base'
require 'sinatra/reloader'

class MakersBNBapp < Sinatra::Base
  enable :sessions
  configure :development do
    register Sinatra::Reloader
  end

  session[:spaces] = []

  get '/' do
    # erb :index will go here
    "Hello World!"
  end

  post "/new_space" do
    session[:spaces] << {name: params["name"],
                      description: params["description"],
                      price: params["price"]}
    redirect "/"
  end

end
