require 'sinatra'
require 'sinatra/reloader'

require 'pg'
require 'pry'

require_relative 'models/investors'
require_relative 'models/ratings'
require_relative 'models/users' 

require_relative 'controllers/investors_controller'
require_relative 'controllers/login_controller'



binding.pry