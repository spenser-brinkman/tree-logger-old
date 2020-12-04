require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, '66f1e7b1c6ad78e94a063deaf705160f'
  end
  
  get "/" do
    if logged_in?
      redirect to "/home"
    else
      erb :landing
    end
  end


  helpers do
    
    def current_user
      @current_user ||= User.find(session[:user_id])
    end

    def logged_in?
      !!session[:user_id]
    end

    def authentication
      redirect '/login' if !logged_in?
    end

    def authorize(resource)
      redirect back if resource.user != current_user
    end

    def today
      DateTime.now.strftime("%Y-%m-%d")
    end
  end
end
