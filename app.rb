require 'sinatra/base'
require './lib/bookmarker'

class App < Sinatra::Base
  enable :sessions, :method_override

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
    Bookmarker.create(params['title'], params['url'])
    redirect('/bookmarks')
  end

  delete '/bookmarks/:id' do
    Bookmarker.delete(params.fetch('id'))
    redirect('/bookmarks')
  end

  run! if app_file == $0
end
