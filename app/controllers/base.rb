require 'sinatra/partial'
require 'rack-flash'
require_relative '../helpers/user_helpers'

class Base < Sinatra::Base
	enable :sessions
  register Sinatra::Partial
  set :session_secret, 'Fat Dave'
  set :partial_template_engine, :erb
  use Rack::Flash
  use Rack::MethodOverride

  helpers UserHelpers

  set :views, File.join(File.dirname(__FILE__), '../views')
  set :public_folder, File.join(File.dirname(__FILE__), '../../public')
end