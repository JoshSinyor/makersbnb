# frozen_string_literal: true

require 'sinatra'
require 'sinatra/base'
require 'sinatra/reloader'

# MakersBNBapp is the controller.
class MakersBNBapp < Sinatra::Base
  enable :sessions
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @spaces = session[:spaces]
    session[:spaces] = []
    erb :index
  end

  post '/new_space' do
    session[:spaces] << { name: params['name'],
                          description: params['description'],
                          price: params['price'] }
    redirect '/'
  end
end
