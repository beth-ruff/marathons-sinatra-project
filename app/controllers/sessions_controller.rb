class SessionsController < ApplicationController
# rather than making sessions views folder, we can tell sessions controller to load things from users controller
    get '/login' do 
        erb :'users/login'
    end 

    post '/login' do 
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
            redirect '/marathons'
        else 
            erb :'users/login'
        end 
    end 


end