# frozen_string_literal: true

require 'sinatra'
require 'sinatra/base'
require 'sinatra/reloader'

class MakersBNBapp < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    # erb :index will go here
    "Hello World!"
  end

end
