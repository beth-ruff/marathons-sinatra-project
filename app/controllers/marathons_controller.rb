class MarathonsController < ApplicationController

    # index, new, show, edit

    get '/marathons' do 
        erb :"marathons/index"
    end 



end 