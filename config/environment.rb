# frozen_string_literal: true

APP_ROOT = File.expand_path('..', __dir__)

# require the controller(s)
# says that app.rb is in the root
Dir.glob(File.join(APP_ROOT, 'app', '*.rb')).each { |file| require file }

# require the model(s)
# models stored in lib/
Dir.glob(File.join(APP_ROOT, 'lib', '*.rb')).each { |file| require file }

# require database configurations
# the database setup files that were just made in config/
require File.join(APP_ROOT, 'config', 'database')

class MakersBNBApp < Sinatra::Base
  set :method_override, true
  set :root, APP_ROOT
  set :views, File.join(APP_ROOT, 'views')
  set :public_folder, File.join(APP_ROOT, 'public')
end
