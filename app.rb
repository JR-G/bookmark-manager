require 'sinatra/base'
require './lib/bookmarks'

class BookmarkManager < Sinatra::Base
  enable :sessions, :method_override

  get '/' do
    'Bookmark Manager'
  end

  get '/bookmarks' do
    @bookmarks = Bookmarks.all
    erb :bookmarks
  end

  get '/bookmarks/new' do
    erb :"bookmarks/new"
  end

  post '/bookmarks' do
    Bookmarks.create(url: params[:url], title: params[:title])
    redirect '/bookmarks'
  end
  
  delete '/bookmarks/:id' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec("DELETE FROM bookmarks WHERE id = #{params[:id]}")
    redirect '/bookmarks'
  end

  run! if app_file == $0

end
