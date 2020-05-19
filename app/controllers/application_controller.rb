require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    
    use Rack::Flash
    enable :sessions
    set :session_secret, "ilovemarathons"

  end

  get '/' do
    erb :welcome
  end

  helpers do 
    
    def logged_in?
      !!session[:user_id]
    end 

    def current_user
      # @user ||= User.find(session[:user_id]) if session[:user_id]
      User.find_by_id(session[:user_id])
    end 

  end 

end
