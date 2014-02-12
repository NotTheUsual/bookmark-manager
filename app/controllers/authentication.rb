require 'sinatra/partial'
require './app/helpers/server_helpers'
require 'rack-flash'

class AuthenticationController < Sinatra::Base
	# enable :sessions
  register Sinatra::Partial
  # set :session_secret, 'Fat Dave'
  set :partial_template_engine, :erb
  use Rack::Flash
  use Rack::MethodOverride

  helpers ServerHelper

  set :views, File.join(File.dirname(__FILE__), '../views')

	get '/sessions/new' do
		erb :"sessions/new"
	end

	post '/sessions' do
		email, password = params[:email], params[:password]
		user = User.authenticate(email, password)
		if user
			session[:user_id] = user.id
			redirect '/'
		else
			flash.now[:errors] = ["The email or password are incorrect"]
			erb :"sessions/new"
		end
	end

	delete '/sessions' do
		flash[:notice] = "Goodbye!"
		session[:user_id] = nil
		redirect to('/')
	end
end