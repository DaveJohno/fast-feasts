require 'sinatra'
require 'sinatra/reloader' if development?
require 'pry' if development?

require_relative 'db/db'
require_relative "models/user"
# require_relative "models/planet"

require_relative "controllers/sessions_controller"
require_relative "controllers/users_controller"
require_relative "controllers/fast_feasts_controller"

require_relative "helpers/sessions_helper"

enable :sessions







