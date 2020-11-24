class UsersController < ApplicationController

  get '/signup' do
    erb :"users/signup"
  end

  post '/signup' do
    @user = User.new(params)
    if !@user.save
      erb :"users/signup"
    elsif @user.save
      redirect to "/login"
    end
  end

  get '/login' do
    erb :"users/login"
  end

  post '/login' do
    if logged_in?
      redirect to "/home"
    else
      user = User.find_by(username: params[:username])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect to "/home"
      else
        @err = "Invalid Credentials"
        erb :"users/login"
      end
    end
  end

  get '/home' do
    authentication
    @user = current_user
    erb :"users/home"
  end

  get '/logout' do
    session.destroy
    redirect to "/"
  end


end