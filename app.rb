require 'sinatra/base'
require './lib/bookmarker'
require './database_connection_setup'
require 'sinatra/flash'
require 'uri'

class App < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  get '/bookmarks' do
    @bookmarks = Bookmarker.all
    erb :bookmarks
  end

  get '/bookmarks/new' do
    erb :new
  end

  post '/bookmarks' do
    url = params['url']
    flash[:url_check] = "Invalid URL. '#{url}' is not a valid URL, please try again!" unless Bookmarker.create(params['title'], url)
    redirect('/bookmarks')
  end

  delete '/bookmarks/:id' do
    Bookmarker.delete(params.fetch('id'))
    redirect('/bookmarks')
  end

  post '/comments/new' do
    print params
    Commenter.create(params['bookmark-id'], params['comment'])
  end

  run! if app_file == $0
end
