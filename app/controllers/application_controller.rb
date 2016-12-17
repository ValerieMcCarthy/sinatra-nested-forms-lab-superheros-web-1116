require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
      erb :super_hero
    end

    post '/teams' do
    	@team = Team.new(params[:team][:name], params[:team][:motto])
    	@members = Member.all
    	params[:team][:members].each do |hero|
    		Member.new(name: hero[:name], power: hero[:power], bio: hero[:bio])
    	end
    	erb :team
    end

    

end
