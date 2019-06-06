require 'sinatra/base'
require './lib/bookmarker'
require './lib/commenter'
require './lib/tag'
require './lib/bookmark_tag'
require './lib/user'
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
    users = User.all
    user = users.find{|user| user.id == session['id']}
    @name = user.name unless user.nil?
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
    Commenter.create(params['bookmark-id'], params['comment'])
    redirect('/bookmarks')
  end

  post '/tag/new' do
    tag_id = Tag.create(params['tag'])
    BookmarkTag.create(params['bookmark-id'], tag_id)
    redirect('/bookmarks')
  end

  get '/register' do
    erb :register
  end

  post '/register/new' do
    id = User.create(params['username'], params['password'], params['name'])
    session[:id] = id[0]['id']
    redirect('/bookmarks')
  end

  run! if app_file == $0
end
