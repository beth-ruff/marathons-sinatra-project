class UsersController < ApplicationController

    get '/users/:id' do 
        if logged_in?
            @user = User.find(params[:id])
            erb :'users/new'
        end 
    end 

    get '/signup' do 
        if logged_in?
            redirect '/marathons'
        else 
            erb :'users/signup'
        end 
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
        session.clear
        redirect '/'
    end 

end