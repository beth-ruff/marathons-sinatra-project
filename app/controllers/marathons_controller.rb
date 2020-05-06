class MarathonsController < ApplicationController

    # index, new, show, edit

    
    get '/marathons' do 
        erb :'marathons/index'
    end 

    get '/marathons/new' do
        erb :'marathons/new'
    end 

    post '/marathons' do 
        @marathon = Marathon.new(params)
        if @marathon.save
            redirect "/marathons/#{@marathon.id}"
        else 
            erb :'marathons/new'
        end 
    end

    get '/marathons/:id' do 
        # params to find use params[:id]
        @marathon = Marathon.find(params[:id])
        erb :'marathons/show'
    end 

    get '/marathons/:id/edit' do 
        @marathon = Marathon.find(params[:id])
        erb :'marathons/edit'
    end 

    patch "/marathons/:id" do 
        @marathon = Marathon.find(params[:id])
        @marathon_params = update_whitelist(params)
        @marathon.update(@marathon_params)
        redirect "/marathons/#{@marathon.id}"
    end 

    get '/marathons/:id/delete' do

    end 

    delete '/marathons/:id/delete' do
    end 

    private

        def update_whitelist(params)
            {
                name: params[:name],
                date: params[:date],
                location: params[:location]
            }
        end 
end 