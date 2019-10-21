require 'gossip.rb'
class ApplicationController < Sinatra::Base
    get '/' do
      erb :index, locals: {gossips: Gossip.all}
    end
    get '/gossips/new' do 
        erb :new_gossip
    end
    post '/gossips/new' do
      puts params["gossip_author"]
      puts params["gossip_content"]
       Gossip.new(params["gossip_author"], params["gossip_content"]).save
      redirect '/'
    end
    get '/gossip/:id' do
      Gossip.find(params["id"])
      erb :show, locals: {gossip: Gossip.find(params["id"])}
    end
    get '/gossips/:id/edit' do
      erb :edit
    end
    post '/gossips/:id/edit' do
       Gossip.update(params["id"], params["gossip_up_author"], params["gossip_up_content"])
      redirect '/'
    end

end