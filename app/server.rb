env = ENV['RACK_ENV'] || "development"

require 'data_mapper'
require 'sinatra/base'
require_relative 'db_config'

Dir.glob(File.join(File.dirname(__FILE__), 'controllers', '*.rb'), &method(:require))

class BookmarkManager < Sinatra::Base

	use LinksController
	use UsersController
	use AuthenticationController

  # start the server if ruby file executed directly
  run! if app_file == $0
end
