require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "a_secret"
    register Sinatra::Flash
  end

  get "/" do
    erb :'/index'
  end

  helpers do
    def logged_in?
       !!session[:user_id]
    end
    def current_user
      user = User.find(session[:user_id])
    end
  end
end
