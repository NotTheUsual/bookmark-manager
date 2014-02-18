require_relative 'base'

class LinksController < Base
  get '/' do
    @links = Link.all
    erb :index
  end

  get '/links/new' do
    erb :"links/new", layout: !request.xhr?
  end

  post '/links' do
	  url = params["url"]
	  title = params["title"]
	  tags = params["tags"].split(" ").map do |tag|
	  	Tag.first_or_create(:text => tag)
	  end
	  link = Link.create(:url => url, :title => title, :tags => tags)
    if request.xhr?
  	  erb :link, locals: {link: link}, layout: nil
    else
      redirect to('/')
    end
	end

	get '/tags/:text' do
		tag = Tag.first(text: params[:text])
		@links = tag ? tag.links : []
		erb :index
	end
end