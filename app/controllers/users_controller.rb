class UsersController < ApplicationController

    get '/users/:id' do 
        @user = User.find(params[:id])
        erb :'users/new'
    end 

    get '/signup' do 
        erb :'users/signup'
    end 

    post '/users/signup' do 
        @user = User.new(params)

        if @user.save
            session[:user_id] = @user.id
            redirect '/marathons'
        else 
            erb :'users/new'
        end 
    end 

    get '/logout' do 
        if session.clear
            redirect '/'
        else 
            redirect '/marathons'
        end 
    end 

    delete '/users/deactivate' do 
    
    end 

end