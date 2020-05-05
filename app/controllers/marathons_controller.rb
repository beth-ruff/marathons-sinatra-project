class MarathonsController < ApplicationController

    # index, new, show, edit

    get '/marathons' do 
        erb :'marathons/index'
    end 

    get '/marathons/new' do
        erb :'marathons/new'
    end 

    post '/marathons' do 

    end

    get '/marathons/:id' do 
        # params to find use params[:id]
        erb :"marathons/show"
    end 

    get '/marathons/:id/edit' do 

    end 

    patch '/marathons/:id' do 

    end 

    get '/marathons/:id/delete' do

    end 

    delete '/marathons/:id/delete' do
    end 

end 