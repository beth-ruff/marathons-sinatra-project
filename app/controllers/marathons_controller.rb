class MarathonsController < ApplicationController

    # index, new, show, edit

    
    get '/marathons' do 
        @marathons = Marathon.all
        erb :'marathons/index'
    end 

    get '/marathons/new' do
        erb :'marathons/new'
    end 

    post '/marathons' do 
       
        @marathon = Marathon.new(params)
        @user = current_user
        @marathon.user = current_user 

        if @marathon.save
            redirect "/marathons/#{@marathon.id}"
        else 
            erb :'marathons/new'
        end 
    end

    get '/marathons/:id' do 
        # params to find use params[:id]
        find_marathon
        if @marathon.user == nil
            flash[:nil_id] = "The marathon details you are looking for no longer exist."
            redirect '/marathons'
        end 
        erb :'marathons/show'
    end 

    get '/marathons/:id/edit' do 
        find_marathon
        erb :'marathons/edit'
    end 

    patch "/marathons/:id" do 
        find_marathon
        if @marathon.user = current_user 
            @marathon_params = update_whitelist(params)
            @marathon.update(@marathon_params)
            redirect "/marathons/#{@marathon.id}"
        else 
            redirect '/marathons'
        end 
    end 

    # get '/marathons/:id/delete' do

    # end 

    delete '/marathons/:id' do
        find_marathon
        if @marathon.user = current_user
            @marathon.destroy
            erb :'marathons/deleted'
        else 
            redirect '/marathons'
        end 
    end 

    private

        def update_whitelist(params)
            {
                name: params[:name],
                date: params[:date],
                location: params[:location]
            }
        end 

        def find_marathon
            @marathon = Marathon.find_by_id(params[:id])
        end 

end 