# frozen_string_literal: true

require 'sinatra'
require 'sinatra/base'
require 'sinatra/reloader'

class MakersBNBapp < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    "Hello World!"
  end

end
