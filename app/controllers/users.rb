class UsersController < Sinatra::Base
	register Sinatra::Partial
	set :partial_template_engine, :erb
	
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