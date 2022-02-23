require 'sinatra'
require 'sinatra/reloader' if development?
require 'pry' if development?
require 'BCrypt'

require_relative 'db/db'
require_relative "models/user"
require_relative "models/food_order"

require_relative "controllers/sessions_controller"
require_relative "controllers/users_controller"
require_relative "controllers/fast_feasts_controller"

require_relative "helpers/sessions_helper"

enable :sessions







