
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/articles' do
    erb :index
  end
  
  get '/articles/new' do
    erb :new
  end
  
  post '/articles' do
    @article=Article.create(params[:article])
    redirect to '/articles/#{@article.id}'
  end
  
  get '/articles' do 
    @articles=Article.all 
    erb :index
  end
end
