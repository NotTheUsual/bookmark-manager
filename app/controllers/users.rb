require 'sinatra/partial'
require './app/helpers/server_helpers'
require 'rack-flash'

class UsersController < Sinatra::Base
	# enable :sessions
  register Sinatra::Partial
  # set :session_secret, 'Fat Dave'
  set :partial_template_engine, :erb
  use Rack::Flash
  use Rack::MethodOverride

  helpers ServerHelper

  set :views, File.join(File.dirname(__FILE__), '../views')
	
	get '/users/new' do
		@user = User.new
		erb :"users/new"
	end

	post '/users' do
		@user = User.new(:email => params[:email], 
	              :password => params[:password],
	              :password_confirmation => params[:password_confirmation])
		if @user.save
			session[:user_id] = @user.id
			redirect to('/')
		else
			flash.now[:errors] = @user.errors.full_messages
			erb :"users/new"
		end
	end
end