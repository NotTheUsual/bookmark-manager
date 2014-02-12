env = ENV['RACK_ENV'] || "development"

require 'data_mapper'
require 'sinatra/base'
require 'sinatra/partial'
require 'rack-flash'
require_relative 'db_config'
require_relative 'helpers/server_helpers'
require_relative 'controllers/users'
require_relative 'controllers/links'
require_relative 'controllers/authentication'

class BookmarkManager < Sinatra::Base

	use LinksController
	use UsersController
	use AuthenticationController

  # start the server if ruby file executed directly
  run! if app_file == $0
end
