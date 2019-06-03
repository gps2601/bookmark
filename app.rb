require 'sinatra/base'
require './lib/bookmarker'

class App < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/bookmarks' do
    @bookmarks = Bookmarker.all
    erb :bookmarks
  end

  run! if app_file == $0
end
